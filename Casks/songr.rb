cask "songr" do
  arch arm: "-arm64"

  version "1.4.6"
  sha256 arm:   "cd1feba5258fd3bdae87c0509c9f660fca2855c8e2f71b6d27d7778e47e9ffbe",
         intel: "059b5a7a35af2993bbcfba74b1f7c8069694ff3e3bd2c94a566d7e4252908545"

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
