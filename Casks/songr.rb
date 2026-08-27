cask "songr" do
  arch arm: "-arm64"

  version "1.2.0"
  sha256 arm:   "b08354491d8c4ce9c526b9ad8830f99ef9960fa8717059b306c33e63227ff075",
         intel: "b3a9449f0a16dc2e1586d2e7f5daf3fc0a99cbcfe9ab1c5336d6425c7e303b5b"

  url "https://github.com/roethlar/songr/releases/download/v#{version}/Songr-#{version}#{arch}.dmg"
  name "Songr"
  desc "Multi platform controller for your Roon Core"
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
