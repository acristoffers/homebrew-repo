class Moirai < Formula
  desc 'Control platform server (Lachesis backend)'
  homepage 'https://github.com/acristoffers/moirai'
  url 'https://files.pythonhosted.org/packages/85/0c/5b98fd25d7716d8a22334df032ded2af2ff755c66aa1f48d2d986617977d/moirai-1.3.23.tar.gz'
  version '1.3.23'
  sha256 '0b89dd7de207e2359bc46f794f0bd081f92e6ace8c719d9c13c9feb9ee3661b0'
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
