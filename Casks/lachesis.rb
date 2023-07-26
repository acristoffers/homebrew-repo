# frozen_string_literal: true

cask 'lachesis' do
  version '1.3.11'

  if Hardware::CPU.intel?
    sha256 'a0f6086eecb1f8524debf3f0c69a210ab57481c60f45d59a99c562c5d206b787'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}.dmg"
  else
    sha256 '65d206028133f7788da20b8c2e88a5518522cf10c25b4e4281f1d3cbf7e6f814'
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
