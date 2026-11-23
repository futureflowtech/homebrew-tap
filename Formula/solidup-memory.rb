class SolidupMemory < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/solidup"
  url "https://github.com/futureflowtech/homebrew-tap/releases/download/solidup-memory-v0.3.9/solidup-memory-0.3.9-darwin-arm64.tar.gz"
  version "0.3.9"
  sha256 "b46088288264fabacf8f7d79fd4189705aa73b9d479eae36a9398c0ace9004e7"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "solidup-memory"
    pkgshare.install "LICENSE", "COZO-SOURCE.txt", "third-party"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/solidup-memory version").strip
    assert_match "recall@3: 1.000", shell_output("#{bin}/solidup-memory eval")
    db = testpath/"memory.redb"
    system bin/"solidup-memory", "remember", "--db", db, "--no-embed", "Use rustls for TLS"
    assert_match "Use rustls for TLS", shell_output("#{bin}/solidup-memory recall --db #{db} rustls")
  end
end
