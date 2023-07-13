# frozen_string_literal: true

cask 'lachesis' do
  version '1.3.10'

  if Hardware::CPU.intel?
    sha256 'dcd9fa0a34353496c12a1dfee253b93d3e947a80e36880dbd3a23db13acc3f5e'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}.dmg"
  else
    sha256 'abdd7c62ac62173c36dbc5705f6fcc7d14d6416784c191fa1006147ab8d3a8b2'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}-arm64.dmg"
  end

  livecheck do
    url 'https://github.com/acristoffers/Lachesis/releases.atom'
    strategy :sparkle
  end
  name 'Lachesis'
  homepage 'https://github.com/acristoffers/Lachesis'

  auto_updates false

  app 'Lachesis.app'

  zap trash: [
    '~/Library/Application\ Support/lachesis',
    '~/Library/Preferences/me.acristoffers.lachesis.plist',
    '~/Library/Logs/Lachesis'
  ]
end
