cask 'lachesis' do
  version '1.3.5'

  if Hardware::CPU.intel?
    sha256 '9d8dc153d39b4a2fa5643688b20c3be5eb8308e855b80c34a7a7603fdd0a9e42'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}.dmg"
  else
    sha256 'b3e7061206a1316477ecef8ec87be122f4f54e3942d6a659a5bb202a33a276f8'
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
