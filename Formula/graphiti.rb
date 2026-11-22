class Graphiti < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/homebrew-tap#graphiti"
  version "0.3.1"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.1/graphiti-0.3.1-darwin-arm64.tar.gz"
    sha256 "e45bc9817d876d75bb33ad634391331d6c2531ec063ebcda1ca668737d3fda14"
  end

  on_linux do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.3.1/graphiti-0.3.1-linux-arm64.tar.gz"
    sha256 "93eb5370472bf8e9a06f0b8c66cda8312639f52eba28d4b5fca82057dca4453f"
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
