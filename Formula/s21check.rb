class S21check < Formula
  desc "School 21 C project checker"
  homepage "https://github.com/s21-tools/s21check"
  url "https://github.com/s21-tools/s21check/archive/refs/tags/v1.0.4.tar.gz"
  sha256 "a091c6dd7753a5677800d64386c61313bf51964c233d330a9d6392b967bf56aa"
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
