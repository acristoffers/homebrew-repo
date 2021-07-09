class Moirai < Formula
  desc 'Control platform server (Lachesis backend)'
  homepage 'https://github.com/acristoffers/moirai'
  url 'https://files.pythonhosted.org/packages/a9/f1/e7fdd3c86beb58043383ee43479492dda53253a7bb088f73a5abc7f36633/moirai-1.3.18.tar.gz'
  version '1.3.18'
  sha256 'd1463ef74555c1c7c9429b6409927e3bc21ecafd45c3546c050b8c22941e9246'
  license 'mit'

  depends_on 'python@3' => :build
  depends_on 'mongodb/brew/mongodb-community'
  depends_on 'python@3'
  depends_on 'snap7'

  def install
    python3 = Formula['python@3.9'].opt_bin / 'python3'
    system python3, *Language::Python.setup_install_args(prefix)
    system python3, '-m', 'moirai', '--install'
  end

  test do
    system 'moirai', '--version'
  end
end
