class Graphiti < Formula
  desc "Offline memory and context CLI backed by embedded CozoDB and redb"
  homepage "https://github.com/futureflowtech/homebrew-tap#graphiti"
  version "0.1.1"
  license all_of: ["Apache-2.0", "MPL-2.0"]

  depends_on arch: :arm64

  on_macos do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.1.1/graphiti-0.1.1-darwin-arm64.tar.gz"
    sha256 "e0dd95f6e234e5fbfb9500aeec96f9ca0213ee4a0b58425c364615be3729df18"
  end

  on_linux do
    url "https://github.com/futureflowtech/homebrew-tap/releases/download/graphiti-v0.1.1/graphiti-0.1.1-linux-arm64.tar.gz"
    sha256 "a62e21e8da50ca8d329a74782e3ec27742df47b07d7e40ae2e0da79d7eb4d1ea"
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
