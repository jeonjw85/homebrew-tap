cask "profnote" do
  version "0.3.7"
  sha256 "c7fa4fc45b42896f7a0198c551d54ac587fd73fe788afe09d9928496f0555be1"

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
