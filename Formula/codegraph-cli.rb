class CodegraphCli < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/codegraph"
  version "1.3.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.2/codegraph-cli-1.3.2-darwin-arm64.tar.gz"
      sha256 "a1826c63a6f88e3340346ea3569244666b8fe23244c5517eb2c2ce9aae653947"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.2/codegraph-cli-1.3.2-darwin-amd64.tar.gz"
      sha256 "d4723e8cbb085a66cf470aea8e2c9c267d606e4b18032fe933161896951a35b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.2/codegraph-cli-1.3.2-linux-arm64.tar.gz"
      sha256 "c36f1378ec2e80075f1d5815e13244831abd8aa3103c75571627a9e03b21c515"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.2/codegraph-cli-1.3.2-linux-amd64.tar.gz"
      sha256 "d01f1ff7c468d1453538a4051f23a5b896a1ca572dbf5966330685b554180d77"
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
    project = testpath/"fixture"
    project.mkpath
    (project/"callee.ts").write("export function Callee(x: number): number { return x + 1; }\n")
    (project/"caller.ts").write <<~JS
      import { Callee } from "./callee";
      export function Caller(x: number): number { return Callee(x); }
    JS
    cd project do
      system bin/"codegraph-cli", "index", "--no-tui"
      assert_match '"name": "Caller"', shell_output("#{bin}/codegraph-cli callers --json Callee")
    end
  end
end
