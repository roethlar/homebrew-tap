cask "songr" do
  arch arm: "-arm64"

  version "1.4.7"
  sha256 arm:   "50212c989e6ce3d1339d3d229c7d614570c7138948fc4886d770ea8f092aca2b",
         intel: "2ff4c45973786b2991e30ded10c8d66d40829054cbc05ba9b3805bc255109cfb"

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
