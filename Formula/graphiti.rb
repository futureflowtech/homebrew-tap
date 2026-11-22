class Graphiti < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/homebrew-tap#graphiti"
  version "0.3.4"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.4/graphiti-0.3.4-darwin-arm64.tar.gz"
    sha256 "be0812407a2bd78d28841bc89c0c75e56a9f30dc1817a0195c494916746719e4"
  end

  on_linux do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.4/graphiti-0.3.4-linux-arm64.tar.gz"
    sha256 "b9d57e7711c15b7a4afce0064939da480a35687a4e6186a97c3a2c379b87ff7a"
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
