cask 'lachesis' do
  version '1.3.6'

  if Hardware::CPU.intel?
    sha256 '37742668407f540ca21d4e3a22965e22b45e0cfecf2c12a5c2a38042e629308e'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}.dmg"
  else
    sha256 'b984af0e847bbd2a530511df1498eb6746ef70ce9e661f314d624e9758f13b57'
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
