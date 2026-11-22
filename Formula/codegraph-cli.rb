class CodegraphCli < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/codegraph"
  version "1.2.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.1/codegraph-cli-1.2.1-darwin-arm64.tar.gz"
      sha256 "427b07743178ba2a53c6cae9ada69461935ae4ee11426c6cdbb15bf92b8dfc89"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.1/codegraph-cli-1.2.1-darwin-amd64.tar.gz"
      sha256 "a57991714aac98b1dcde86c806b7c230b4ab8fd61cce5aa735b3699eb6011a28"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.1/codegraph-cli-1.2.1-linux-arm64.tar.gz"
      sha256 "c4f5397f4b863cd4f60e1139ca79c4b4cf73bfe21350218d03b70005c25d6e26"
    end
    on_intel do
      url "https://github.com/futureflowtech/homebrew-tap/releases/download/codegraph-v1.2.1/codegraph-cli-1.2.1-linux-amd64.tar.gz"
      sha256 "608189082be0c745c7154257c08f077ce5621aef48258dee84ee2a65578a6401"
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
