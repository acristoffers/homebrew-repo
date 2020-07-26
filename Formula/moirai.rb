class Moirai < Formula
  desc "Control platform server (Lachesis backend)"
  homepage "https://github.com/acristoffers/moirai"
  url "https://files.pythonhosted.org/packages/17/58/7a4f045688811258c10815fc5331c45f4c2adce8ec6f812c3627c8446a2d/moirai-1.3.17.tar.gz"
  version "1.3.17"
  sha256 "921bf9591c15d5c824bcde0967f2fcbe342108d67b147ff2f6519e11ab03d900"
  license "mit"

  depends_on "python@3" => :build
  depends_on "mongodb/brew/mongodb-community"
  depends_on "python@3"
  depends_on "snap7"

  def install
    system Formula["python@3.8"].opt_bin/"python3", *Language::Python.setup_install_args(prefix)
    system Formula["python@3.8"].opt_bin/"python3", "-m", "moirai", "--install"
  end

  test do
    system "moirai", "--version"
  end
end
