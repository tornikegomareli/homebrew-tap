class Rexd < Formula
  desc "Plugin manager and process supervisor for Rex"
  homepage "https://github.com/tornikegomareli/rexd"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.1/rexd_darwin_arm64.tar.gz"
      sha256 "46c82574b2b127b8e9928c3766f27a94b11eb8a45f99e0407f4a639bea4a9523"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.1/rexd_darwin_amd64.tar.gz"
      sha256 "f369314839ab158b0f0452b76fe88e46fca7fd50ef3fb0dbc29c4b7f7f5dec3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.1/rexd_linux_arm64.tar.gz"
      sha256 "9196a4067ba5d05e3c9ceb404cedebe4c3710df9f6cf5ace61457dde6fa43e95"
    end
    on_intel do
      url "https://github.com/tornikegomareli/rexd/releases/download/v0.2.1/rexd_linux_amd64.tar.gz"
      sha256 "54eb71afbc3468432fad7bba19040ad508e25a22acb792c15df014d8126b2ad6"
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
