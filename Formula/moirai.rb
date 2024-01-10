class Moirai < Formula
  desc 'Control platform server (Lachesis backend)'
  homepage 'https://github.com/acristoffers/moirai'
  url 'https://files.pythonhosted.org/packages/01/3c/18b9ff3f052e3cb9067a799151d29761d8dd4c6fff554d1a1fb00dedcd07/moirai-1.3.29.tar.gz'
  version '1.3.29'
  sha256 'f69da3155858f0d1ecda9325a60a108b432c5ec7ea6a79e7b2998c60fe3d3911'
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
