class Rexd < Formula
  desc "Plugin manager and process supervisor for Rex"
  homepage "https://github.com/tornikegomareli/rexd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.2/rexd_darwin_arm64.tar.gz"
      sha256 "3c2140463fac6ba247576163d96d99004aac4ade9582e2cb09b1d93aa1e577c6"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.2/rexd_darwin_amd64.tar.gz"
      sha256 "eaa58c147d909b085fcbd9a49cc636c65017e16b4d1f982be1eeb93a0e82cb29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.2/rexd_linux_arm64.tar.gz"
      sha256 "d7a1b5483f3e55631bb1c325e213450e5b8d415e4c814cb42644440013146d69"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.2/rexd_linux_amd64.tar.gz"
      sha256 "299004a92801426d12e2fe06505cb5b1a9d6a65416ef9936143b14b69cc7e338"
    end
  end

  def install
    bin.install "rexd"
  end

  def caveats
    <<~EOS
      Run `rexd setup` to connect rexd to Rex and start its daemon.
      Run it again after each upgrade, to restart the daemon with the new version.

      For the menu bar app: brew install --cask tornikegomareli/tap/rexd-app
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rexd version")
  end
end
