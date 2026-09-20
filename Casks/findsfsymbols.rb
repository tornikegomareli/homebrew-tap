cask "findsfsymbols" do
  version "0.1.0"
  sha256 "a5cc0a48e383709b5b6822f61f9de3971bd215746dfdaaf6749a5342ebbbb485"

  url "https://github.com/tornikegomareli/FindSFSymbols/releases/download/v#{version}/FindSFSymbols-#{version}.zip"
  name "FindSFSymbols"
  desc "Semantic SF Symbols search with a physics pile"
  homepage "https://tornikegomareli.github.io/FindSFSymbols/"

  depends_on macos: :sonoma

  app "FindSFSymbols.app"

  zap trash: [
    "~/Library/Preferences/dev.gomareli.findsfsymbols.plist",
  ]
end
