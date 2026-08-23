#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
CASK="$ROOT/Casks/profnote.rb"
REPO="${PROFNOTE_REPO:-jeonjw85/profNote}"

TAG="$(gh release view --repo "$REPO" --json tagName --jq .tagName)"
VERSION="${TAG#v}"
ASSET="profNote_${VERSION}_aarch64.dmg"

CURRENT="$(sed -n 's/^  version "\(.*\)"/\1/p' "$CASK" | head -1)"
if [ "$CURRENT" = "$VERSION" ]; then
  echo "cask already at $VERSION"
  exit 0
fi

WORKDIR="$(mktemp -d)"
cleanup() { rm -rf "$WORKDIR"; }
trap cleanup EXIT

gh release download "$TAG" --repo "$REPO" --pattern "$ASSET" --dir "$WORKDIR"
SHA="$(shasum -a 256 "$WORKDIR/$ASSET" | awk '{print $1}')"

python3 - "$CASK" "$VERSION" "$SHA" <<'PY'
from pathlib import Path
import re
import sys

path, version, sha = Path(sys.argv[1]), sys.argv[2], sys.argv[3]
text = path.read_text()
text = re.sub(r'^  version ".*"$', f'  version "{version}"', text, count=1, flags=re.M)
text = re.sub(r'^  sha256 ".*"$', f'  sha256 "{sha}"', text, count=1, flags=re.M)
path.write_text(text)
PY

echo "bumped $CURRENT -> $VERSION ($SHA)"

if [ -n "${GITHUB_ACTIONS:-}" ]; then
  git config user.name "github-actions[bot]"
  git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git add Casks/profnote.rb
  if git diff --staged --quiet; then
    exit 0
  fi
  git commit -m "profnote $VERSION"
  git push
fi
