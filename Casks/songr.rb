cask "songr" do
  arch arm: "-arm64"

  version "1.3.0"
  sha256 arm:   "c0965ec0fd6c4bf48260f66ebaf451cfbd2f9fe11902dcea98212a405c12a00d",
         intel: "86e26b92b90e4362522ebf07ff6ad6be6d8bb70b79116e08c9103b45bae31ba5"

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
