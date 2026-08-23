# jeonjw85/homebrew-tap

[profNote](https://github.com/jeonjw85/profNote) Homebrew cask.

## Install

```bash
brew install --cask jeonjw85/tap/profnote
```

## Version bump (after each profNote release)

1. Download the new `profNote_<version>_aarch64.dmg` from the profNote release.
2. Run `shasum -a 256 <dmg>` and update `version` / `sha256` in `Casks/profnote.rb`.
3. Commit and push. Users upgrade with `brew upgrade --cask profnote`.
