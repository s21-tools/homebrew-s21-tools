class S21check < Formula
  desc "School 21 C project checker"
  homepage "https://github.com/s21-tools/s21check"
  url "https://github.com/s21-tools/s21check/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "307aa17abef9baac3f5d9b51aa8372a557c36fd981c3cbaf501f3803381b9886"
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
