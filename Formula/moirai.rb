class Moirai < Formula
  desc 'Control platform server (Lachesis backend)'
  homepage 'https://github.com/acristoffers/moirai'
  url 'https://files.pythonhosted.org/packages/5b/0a/db382b48bfd7b1e083b4ab81e766d998ce7d2c69ef6f80bbb87e4ab11214/moirai-1.3.26.tar.gz'
  version '1.3.25'
  sha256 'ea193d413332eafccb2f08ad867310c9d05313368afd88caa449e2a8ce982d1c'
  license 'mit'

  depends_on 'python@3' => :build
  depends_on 'mongodb/brew/mongodb-community'
  depends_on 'python@3'
  depends_on 'snap7'

  def install
    python3 = Formula['python@3'].opt_bin / 'python3'
    system python3, *Language::Python.setup_install_args(prefix)
    system python3, '-m', 'moirai', '--install'
  end

  test do
    system 'moirai', '--version'
  end
end
