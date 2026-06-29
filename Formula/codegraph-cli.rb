class CodegraphCli < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/codegraph"
  version "1.0.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.0.0/codegraph-cli-1.0.0-darwin-arm64.tar.gz"
      sha256 "f9f6049853387f766ddb6f17474084780ad74295fa5088ffb340ee273a4c21a2"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.0.0/codegraph-cli-1.0.0-darwin-amd64.tar.gz"
      sha256 "49d47a5358c525ef9efbffb67fdee28713e6a241dd11e412908780f9e61aa82a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.0.0/codegraph-cli-1.0.0-linux-arm64.tar.gz"
      sha256 "7783b4bb7deb9611bbbdee44e02320b52e6e0c162cd5d62db88c4151ffcd46af"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.0.0/codegraph-cli-1.0.0-linux-amd64.tar.gz"
      sha256 "da9fe175e33458feddd7823e1a3a834994c2a696a149c642636383458b0d7ce3"
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
