class Rexd < Formula
  desc "Plugin manager and process supervisor for Rex"
  homepage "https://github.com/tornikegomareli/rexd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.1/rexd_darwin_arm64.tar.gz"
      sha256 "cb8cda6caed8b669f26ca9f79660225b25a8d1540302b6f405c73a3bd949d817"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.1/rexd_darwin_amd64.tar.gz"
      sha256 "799d4b807d32ee60523bdcdbdc83325b5b7b92f2f933143264b5b7615fd23d10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.1/rexd_linux_arm64.tar.gz"
      sha256 "5e99acc10a9f65b284fd34ece1f53c28fdb7625a0d2f4b4057702c25e95254e0"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.1/rexd_linux_amd64.tar.gz"
      sha256 "6b2fa5d64629e975ce4b59b1c3fbf22560e94bd7e4871d51f876b5123cffe995"
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
