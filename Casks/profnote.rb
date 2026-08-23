cask "profnote" do
  version "0.3.0"
  sha256 "651ecc74681b4cd8d2904ad44534bc28a742a2caf8a1fd524a52022e0bdd7717"

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
