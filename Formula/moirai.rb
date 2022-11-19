class Moirai < Formula
  desc 'Control platform server (Lachesis backend)'
  homepage 'https://github.com/acristoffers/moirai'
  url 'https://files.pythonhosted.org/packages/93/1a/b0fcc6bd04524cfce9bfd4825c268186c02fe49cc38f26975cce89ba1cd8/moirai-1.3.24.tar.gz'
  version '1.3.24'
  sha256 '1822d3880a44a6841610fda9f5aa4a2e21feb161f6a37e70b06a7423292ff0ec'
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
