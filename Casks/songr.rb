cask "songr" do
  arch arm: "-arm64"

  version "1.4.3"
  sha256 arm:   "62083b0245dbc4f238426947d04916033d74854544891611d75133fe25e172fa",
         intel: "0fd168bdc53ad30f0a8f61a8b8557d12969ae45e775b2f61b9bfaa6cc11432ca"

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
