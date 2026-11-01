cask "rexd-app" do
  version "0.3.1"
  sha256 "a64ae993321677343a7cddf3e0a4f938c8a8257af5d07743d4186962c308f178"

  url "https://github.com/tornikegomareli/rexd/releases/download/v#{version}/Rexd-#{version}.zip"
  name "Rexd"
  desc "Menu bar app that controls rexd, the plugin manager for Rex"
  homepage "https://github.com/tornikegomareli/rexd"

  depends_on macos: :sonoma

  app "Rexd.app"

  zap trash: "~/Library/Preferences/io.github.tornikegomareli.rexd.menu.plist"

  caveats <<~EOS
    Rexd controls the rexd command. If you do not have it yet:
      brew install tornikegomareli/tap/rexd

    Open Rexd once. It lives in the menu bar, and it can start at login from its menu.
  EOS
end
