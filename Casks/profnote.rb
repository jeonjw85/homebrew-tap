cask "profnote" do
  version "0.3.12"
  sha256 "d41a5f83ed4e2b416628a34fec9ca977ae3702815467967a5ad692bd083b5261"

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
