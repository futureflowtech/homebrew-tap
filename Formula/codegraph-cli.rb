class CodegraphCli < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/codegraph"
  version "1.3.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.0/codegraph-cli-1.3.0-darwin-arm64.tar.gz"
      sha256 "af0fbbc9820aaab9103c2ee662b91c670c89f3eea600645d1568760352f94c97"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.0/codegraph-cli-1.3.0-darwin-amd64.tar.gz"
      sha256 "366de9ee45f3091f1064b9c1f3a19e302a5ec3ea365ed9a98f17b7acbd6e8306"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.0/codegraph-cli-1.3.0-linux-arm64.tar.gz"
      sha256 "53f7bfd27ab70162701a1f7e8d04ad039db1b81303e912f1ef4c806363c8b753"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.3.0/codegraph-cli-1.3.0-linux-amd64.tar.gz"
      sha256 "ece681c1692159827712be8eed6c7f9360c995cc9bfd04103f3ba576a54db0bb"
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
