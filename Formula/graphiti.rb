class Graphiti < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/homebrew-tap#graphiti"
  version "0.1.0"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.1.0/graphiti-0.1.0-darwin-arm64.tar.gz"
    sha256 "f598db4b256095f040d38352515ed3c74a5267e29d33fec2167a560040b6c313"
  end

  on_linux do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.1.0/graphiti-0.1.0-linux-arm64.tar.gz"
    sha256 "bc17723637f2d1a32224c577a22b5acc80e3cdf980a07bab7f5fe073a57769a8"
  end

  def install
    bin.install "graphiti"
    pkgshare.install "LICENSE", "COZO-SOURCE.txt", "third-party"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/graphiti version").strip
    assert_match "recall@3: 1.000", shell_output("#{bin}/graphiti eval")
  end
end
