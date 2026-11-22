class CodegraphCli < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/codegraph"
  version "1.2.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.0/codegraph-cli-1.2.0-darwin-arm64.tar.gz"
      sha256 "da7534471b076f77c25c0f6b898a5adda97b577b9348da2da5ca026c032cfdf3"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.0/codegraph-cli-1.2.0-darwin-amd64.tar.gz"
      sha256 "19d6f220d96f1d48e607bdc080ef5851934699387c8b2323583aff945bafbdf3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.0/codegraph-cli-1.2.0-linux-arm64.tar.gz"
      sha256 "07817447acaf52c8033380dfea9abe27170fd6030458f89b5b69cda03f412a69"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.0/codegraph-cli-1.2.0-linux-amd64.tar.gz"
      sha256 "5abb15070f4cd969974d7d05c13eae10cea03d533d71ba00e19b0f47aa7e4fe7"
    end
  end

  def install
    bin.install "codegraph-cli"
    bin.install_symlink "codegraph-cli" => "codegraph"
    pkgshare.install "LICENSE", "COZO-SOURCE.txt", "third-party"
  end

  test do
    ENV.delete("COZO_LIB_PATH")
    assert_equal version.to_s, shell_output("#{bin}/codegraph version").strip
    (testpath/"callee.ts").write("export function Callee(x: number): number { return x + 1; }\n")
    (testpath/"caller.ts").write <<~JS
      import { Callee } from "./callee";
      export function Caller(x: number): number { return Callee(x); }
    JS
    system bin/"codegraph-cli", "index", "--no-tui"
    assert_match '"name": "Caller"', shell_output("#{bin}/codegraph-cli callers --json Callee")
  end
end
