# frozen_string_literal: true

cask 'lachesis' do
  version '1.3.6'

  if Hardware::CPU.intel?
    sha256 '37742668407f540ca21d4e3a22965e22b45e0cfecf2c12a5c2a38042e629308e'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}.dmg"
  else
    sha256 'd24683385e228ddf270dfae341c871e5bc10a9eb2a3963560602555aaeb684e7'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}-arm64.dmg"
  end

  appcast 'https://github.com/acristoffers/lachesis/releases.atom'
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
