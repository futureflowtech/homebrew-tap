class Graphiti < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/homebrew-tap#graphiti"
  version "0.3.7"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.7/graphiti-0.3.7-darwin-arm64.tar.gz"
    sha256 "08fb4d294e1af99d5f5c2c71392e70ac3ab093cdcd17d3104c2a7e1d5264c620"
  end

  on_linux do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.7/graphiti-0.3.7-linux-arm64.tar.gz"
    sha256 "9441cb0e019a790bbd9decf6e1475b660c8e33d1cfcad20a91f3400efa6fc0eb"
  end

  def install
    bin.install "graphiti"
    pkgshare.install "LICENSE", "COZO-SOURCE.txt", "third-party"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/graphiti version").strip
    assert_match "recall@3: 1.000", shell_output("#{bin}/graphiti eval")
    db = testpath/"memory.redb"
    system bin/"graphiti", "remember", "--db", db, "--no-embed", "Use rustls for TLS"
    assert_match "Use rustls for TLS", shell_output("#{bin}/graphiti recall --db #{db} rustls")
  end
end
