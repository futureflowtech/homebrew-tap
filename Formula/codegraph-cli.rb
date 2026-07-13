class CodegraphCli < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/codegraph"
  version "1.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.1.0/codegraph-cli-1.1.0-darwin-arm64.tar.gz"
      sha256 "7879f57e27ed0044284742e83236ffe73a49fa8fc1069c795c9d54821cdf0bf4"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.1.0/codegraph-cli-1.1.0-darwin-amd64.tar.gz"
      sha256 "8facef5bc655aab80280ab62feaf23f82a2c5c35570c7f5fdea62f994ec204c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.1.0/codegraph-cli-1.1.0-linux-arm64.tar.gz"
      sha256 "c5a0a83c5b5601f04042f9ab0ac0853eebbf8f026a4bb00791fbb164617e0a7e"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.1.0/codegraph-cli-1.1.0-linux-amd64.tar.gz"
      sha256 "014cf849c3b9dd598657498e098dd983e80eb2d23a74be52b43de97675db6b7a"
    end
  end

  def install
    bin.install "codegraph-cli"
    bin.install_symlink "codegraph-cli" => "codegraph"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/codegraph-cli version")
  end
end
