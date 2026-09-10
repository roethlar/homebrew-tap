cask "songr" do
  arch arm: "-arm64"

  version "1.4.1"
  sha256 arm:   "7b04ce86df6683c21a3a8ced1304dd2389cb5df05bed8ee111570e9df0415c94",
         intel: "35decbcbfb7f3b209077746d854aa13183a79711ad98e922cc352984bdd24134"

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
