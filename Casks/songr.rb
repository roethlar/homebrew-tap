cask "songr" do
  arch arm: "-arm64"

  version "1.4.4"
  sha256 arm:   "79067fc0e10d347cf8300d39f49f6c468794f30ec3993537c6e5fbeb7b7ccb6a",
         intel: "c25b7b877ee6d540250d535acd80144990e227df9b7d2c1068b1549822337061"

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
