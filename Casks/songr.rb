cask "songr" do
  arch arm: "-arm64"

  version "1.4.5"
  sha256 arm:   "81234e4ab30b99d13ec510eb9db1805c0663a03647a692f1866eb58367f745dc",
         intel: "be1b07d46a92ca59907c26c400394cf89fbccc3390866f6f93be24c79a9c505c"

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
