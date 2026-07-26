cask "promptbar" do
  version "0.2.0"
  sha256 "e367bf013eb418e05a616e982b4332d2e2e82b78ced971a7612f1d488ebd54a1"

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
    PromptBar runs in the menu bar with no Dock icon. Press ⇧⌥Space to open it,
    or ⇧⌥E to rewrite the clipboard in place.

    Enhancement needs Apple Intelligence switched on:
      System Settings → Apple Intelligence & Siri
    Until it is enabled, PromptBar says so and offers to open that pane.

    The optional Compile chip, which appears when you select text in other apps,
    is off by default and needs Accessibility access. Turn it on in
    PromptBar → Settings → General → Selection. Nothing else asks for a permission.
  EOS
end
