cask "findsfsymbols" do
  version "0.1.2"
  sha256 "397c3e45462d53f86d660ffda9f304676c6d875a0aa1e7b83a25c0d65325bb4b"

  url "https://github.com/tornikegomareli/FindSFSymbols/releases/download/v#{version}/FindSFSymbols-#{version}.zip"
  name "FindSFSymbols"
  desc "Semantic SF Symbols search with a physics pile"
  homepage "https://tornikegomareli.github.io/FindSFSymbols/"

  # The app updates itself with Sparkle. This stops brew from reporting it as outdated.
  auto_updates true
  depends_on macos: :sonoma

  app "FindSFSymbols.app"

  zap trash: [
    "~/Library/Preferences/dev.gomareli.findsfsymbols.plist",
  ]
end
