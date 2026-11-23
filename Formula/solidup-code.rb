class SolidupCode < Formula
  desc "Structural code graph — index and query a codebase"
  homepage "https://github.com/futureflowtech/solidup"
  url "https://github.com/futureflowtech/homebrew-tap/releases/download/solidup-code-v1.3.3/solidup-code-1.3.3-darwin-arm64.tar.gz"
  version "1.3.3"
  sha256 "4ff6f0c1d4e7534478e57b61661ce1c5e645584c3912ab5839c662727f2f7ab8"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "solidup-code"
    pkgshare.install "LICENSE", "COZO-SOURCE.txt", "third-party"
  end

  test do
    ENV.delete("COZO_LIB_PATH")
    assert_equal version.to_s, shell_output("#{bin}/solidup-code version").strip
    project = testpath/"fixture"
    project.mkpath
    (project/"callee.ts").write("export function Callee(x: number): number { return x + 1; }\n")
    (project/"caller.ts").write <<~JS
      import { Callee } from "./callee";
      export function Caller(x: number): number { return Callee(x); }
    JS
    cd project do
      system bin/"solidup-code", "index", "--no-tui"
      assert_match '"name": "Caller"', shell_output("#{bin}/solidup-code callers --json Callee")
    end
  end
end
