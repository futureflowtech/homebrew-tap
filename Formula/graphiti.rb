class Graphiti < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/homebrew-tap#graphiti"
  version "0.3.6"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.6/graphiti-0.3.6-darwin-arm64.tar.gz"
    sha256 "02ff6170b0e3225c254525b42338638133d8fe657c80079700713da69c42577d"
  end

  on_linux do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.6/graphiti-0.3.6-linux-arm64.tar.gz"
    sha256 "a5ca5a5de09357c0e51ae2843e9dce2d58e4a6ca4614841527dbb0763c7346c4"
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
