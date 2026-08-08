cask "songr" do
  arch arm: "-arm64"

  version "1.1.3"
  sha256 arm:   "3bc0630d1817932142ba5dc1fb91bc981f3d7c04c7cc9d8fe1e61d7b61857e19",
         intel: "071e9378af6bd17d12a16898593dc676d2c977c8d0f7f4c0ed8091e6c608a62f"

  url "https://github.com/roethlar/songr/releases/download/v#{version}/Songr-#{version}#{arch}.dmg"
  name "Songr"
  desc "Controller for a Roon music library"
  homepage "https://github.com/roethlar/songr"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: :monterey

  app "Songr.app"

  zap trash: [
    "~/Library/Application Support/Songr",
    "~/Library/Preferences/app.songr.desktop.plist",
    "~/Library/Saved Application State/app.songr.desktop.savedState",
  ]
end
