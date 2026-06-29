class CodegraphCli < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/codegraph"
  version "0.0.0"
  license :cannot_represent

  # NOTE: This is a seed placeholder. The release workflow in the converse repo
  # (.github/workflows/release-codegraph.yml) overwrites this file with real
  # urls + sha256s on each published release.

  on_macos do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v0.0.0/codegraph-cli-0.0.0-darwin-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v0.0.0/codegraph-cli-0.0.0-darwin-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v0.0.0/codegraph-cli-0.0.0-linux-arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v0.0.0/codegraph-cli-0.0.0-linux-amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
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
