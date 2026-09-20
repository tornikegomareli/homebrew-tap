cask "findsfsymbols" do
  version "0.1.1"
  sha256 "804624ca8640e2ea19142e83dc42cf18595d692e6a98c9e15ecdae27853bbbe5"

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
