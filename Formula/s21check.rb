class S21check < Formula
  desc "School 21 C project checker"
  homepage "https://github.com/s21-tools/s21check"
  url "https://github.com/s21-tools/s21check/archive/refs/tags/v1.0.5.tar.gz"
  sha256 "f5e5868de43a9b3bbe35c6ef1b39267725a912864582255fc48a553761ba6bbb"
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
