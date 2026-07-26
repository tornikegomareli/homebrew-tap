cask "promptbar" do
  version "0.1.0"
  sha256 "1deceb6be551a1d19d29aea9664577b6cda8f493b91b8cecdc4a7c73756e7dc1"

  url "https://github.com/tornikegomareli/PromptBar/releases/download/v#{version}/PromptBar-#{version}.zip"
  name "PromptBar"
  desc "Menu bar prompt compiler powered by Apple's on-device Foundation Models"
  homepage "https://github.com/tornikegomareli/PromptBar"

  depends_on macos: ">= :tahoe"
  depends_on arch: :arm64

  app "PromptBar.app"

  # The app is ad-hoc signed (not notarized); clear quarantine so the
  # first launch isn't blocked by Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/PromptBar.app"],
                   sudo: false
  end

  uninstall quit: "com.promptbar.app"

  zap trash: [
    "~/Library/Application Support/PromptBar",
    "~/Library/Preferences/com.promptbar.app.plist",
    "~/Library/Caches/com.promptbar.app",
  ]

  caveats <<~EOS
    PromptBar runs in the menu bar with no Dock icon. Press ⇧⌥Space to open it.

    Enhancement needs Apple Intelligence switched on:
      System Settings → Apple Intelligence & Siri
    Until it is enabled, PromptBar says so and offers to open that pane.
  EOS
end
