cask "songr" do
  arch arm: "-arm64"

  version "1.1.6"
  sha256 arm:   "4b72f2fde03bbe42da9e4ad145c4aaa9723be32db3249216a1cf61462967c9ff",
         intel: "7f5e8e7ac1a38926fbe797d6d38d6c854f45dcf02ef0e74a3c0792d6b1133f87"

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
