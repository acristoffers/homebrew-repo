# frozen_string_literal: true

cask 'lachesis' do
  version '1.3.7'

  if Hardware::CPU.intel?
    sha256 '28a6f56dd9052d40efe6dadead9c107f412505ac0cfb6efcb439a7843156b393'
    url "https://github.com/acristoffers/Lachesis/releases/download/v#{version}/Lachesis-#{version}.dmg"
  else
    sha256 'e3fca7c13b907d1c3e09349b0925b584448a1333477e55cbfa100dccd3d95ece'
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
