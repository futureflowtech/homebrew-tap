class Graphiti < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/homebrew-tap#graphiti"
  version "0.2.0"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.2.0/graphiti-0.2.0-darwin-arm64.tar.gz"
    sha256 "c4d1b43e2d39bb32a69d8a413f96258250c27ce1d2422c5e16f11007cfbbd0cb"
  end

  on_linux do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.2.0/graphiti-0.2.0-linux-arm64.tar.gz"
    sha256 "3739a581801c791bf342e22d7f52ab6552cf654dfca68c2061121b5d25adfd26"
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
