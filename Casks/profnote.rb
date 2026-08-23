cask "profnote" do
  version "0.3.2"
  sha256 "f2a578b1fcd98c90aeee29841c922ad0fe33d8d9c3676b832ea2072a208e0cbb"

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
