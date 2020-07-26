cask 'lachesis' do
  version '1.3.4'
  sha256 'd93ad4e33d0050a5cf006a35dae9c5c0a5fc6b950a54e7061ed9da7ba07037ee'

  url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}.dmg"
  appcast 'https://github.com/acristoffers/lachesis/releases.atom'
  name 'Lachesis'
  homepage 'https://github.com/acristoffers/Lachesis'

  auto_updates true

  app 'Lachesis.app'

  zap trash: [
               '~/Library/Application\ Support/lachesis',
               '~/Library/Preferences/me.acristoffers.lachesis.plist',
               '~/Library/Logs/Lachesis',
             ]
end
