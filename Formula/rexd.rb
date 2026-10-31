class Rexd < Formula
  desc "Plugin manager and process supervisor for Rex"
  homepage "https://github.com/tornikegomareli/rexd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.2/rexd_darwin_arm64.tar.gz"
      sha256 "df2f94c3a47811191df19567d3e4af038697ab97f55f29ce18c45584ab2558cc"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.2/rexd_darwin_amd64.tar.gz"
      sha256 "8d31c93c1d30d3de6bb9ce52ed5abc7dca3efce5610c3537a29fba85ad34435c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.2/rexd_linux_arm64.tar.gz"
      sha256 "0f54e528499cc23dda5b254e2c3bf3a468082fa346b1e68aacd338dfac628e98"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.2/rexd_linux_amd64.tar.gz"
      sha256 "426331341c357bd01920865d0c9cc20d41e5b22ec33bedc7ac9465d5a727f7d7"
    end
  end

  def install
    bin.install "rexd"
  end

  def caveats
    <<~EOS
      Run `rexd setup` to connect rexd to Rex and start its daemon.
      Run it again after each upgrade, to restart the daemon with the new version.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rexd version")
  end
end
