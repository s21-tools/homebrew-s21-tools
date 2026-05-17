class S21check < Formula
  desc "School 21 C project checker"
  homepage "https://github.com/s21-tools/s21check"
  url "https://github.com/s21-tools/s21check/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "4d740cd66af6a70f5f0ac10fecf70a19ae0c44b2643e74d3cbf5618bc388a442"
  license "MIT"

  def install
    bin.install "bin/s21check"

    pkgshare.install "lib"

    inreplace bin/"s21check",
      'ROOT_DIR="$(cd -- "$SCRIPT_DIR/.." && pwd)"',
      "ROOT_DIR=\"#{pkgshare}\""
  end

  test do
    assert_match "s21check", shell_output("#{bin}/s21check help")
  end
end
