cask "promptbar" do
  version "0.1.1"
  sha256 "298861980decc3fdd5e9d834dcc59bd6f0cbb0f17464fdc30e164e821cc7276e"

  url "https://github.com/tornikegomareli/PromptBar/releases/download/v#{version}/PromptBar-#{version}.zip"
  name "PromptBar"
  desc "Menu bar prompt compiler powered by Apple's on-device Foundation Models"
  homepage "https://github.com/tornikegomareli/PromptBar"

  depends_on macos: :tahoe
  depends_on arch: :arm64

  app "PromptBar.app"

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
