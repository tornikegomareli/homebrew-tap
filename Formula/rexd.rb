class Rexd < Formula
  desc "Plugin manager and process supervisor for Rex"
  homepage "https://github.com/tornikegomareli/rexd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.0/rexd_darwin_arm64.tar.gz"
      sha256 "4681f6d6be4d7a31bb3c1e737a53b4932c0356e2aed86df8d6333ceb6d7d3404"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.0/rexd_darwin_amd64.tar.gz"
      sha256 "a15c41b1d7096f00369fe56a3a89cf5f05617db2b981a998d3e4573be7712418"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.0/rexd_linux_arm64.tar.gz"
      sha256 "e127759f6b1a421e81a7bba6f8c924bd4dc152a1c8ae1c71affbfdc5838f6160"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.3.0/rexd_linux_amd64.tar.gz"
      sha256 "d3ae93505898383db7893baedae2b9f6463ef2b88aec28d3109b44fd8e5f7e38"
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
