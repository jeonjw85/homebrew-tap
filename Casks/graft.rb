cask "graft" do
  version "0.2.1"
  sha256 "52e73b552057a31cf4743617e8738b763c060b0259c4bc623f5b4e5e4879dac5"

  url "https://github.com/jeonjw85/Graft/releases/download/v#{version}/Graft-#{version}.dmg",
      verified: "github.com/jeonjw85/Graft/"
  name "Graft"
  desc "LAN-only continuity between macOS and Android for files, clipboard, and alerts"
  homepage "https://github.com/jeonjw85/Graft"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Graft.app"

  zap trash: [
    "~/Library/Application Support/Graft",
    "~/Library/Preferences/kr.jjw.graft.mac.plist",
  ]

  caveats <<~EOS
    Graft is ad-hoc signed and not notarized. If macOS blocks the first launch:
      xattr -dr com.apple.quarantine /Applications/Graft.app
    Or open System Settings -> Privacy & Security -> Open Anyway.
  EOS
end
