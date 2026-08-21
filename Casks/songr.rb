cask "songr" do
  arch arm: "-arm64"

  version "1.1.4"
  sha256 arm:   "beca4f0e6adefa564fa5d9546e04b071d14fcec4d91bc1681c11565eef3f2d65",
         intel: "381d3290598b92731cb7d08dee51c9e463efca11b123e4632cb5582f7692930c"

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
