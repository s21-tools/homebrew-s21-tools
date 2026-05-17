class S21check < Formula
  desc "School 21 C project checker"
  homepage "https://github.com/s21-tools/s21check"
  url "https://github.com/s21-tools/s21check/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
