cask "profnote" do
  version "0.3.11"
  sha256 "8fe349d460f9779fe8e71a28090446008490b9fea7cdb9a6f3608f621225b0b6"

  url "https://github.com/jeonjw85/profNote/releases/download/v#{version}/profNote_#{version}_aarch64.dmg",
      verified: "github.com/jeonjw85/profNote/"
  name "profNote"
  desc "Lecture recorder and markdown note editor"
  homepage "https://github.com/jeonjw85/profNote"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :catalina

  app "profNote.app"
end
