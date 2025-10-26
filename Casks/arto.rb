cask "arto" do
  version "0.2.1"
  sha256 "4cb978e1110138521801ff3e1afccf79fdd6fc48d0b5e53b873bd8e25a8efa7b"

  url "https://github.com/lambdalisue/rs-arto/releases/download/v#{version}/Arto_0.1.0_aarch64.dmg"
  name "Arto"
  desc "GitHub-style Markdown reader"
  homepage "https://github.com/lambdalisue/rs-arto"

  depends_on arch: :arm64

  app "Arto.app"

  caveats <<~EOS
    Upstream binaries are not signed or notarized with an Apple Developer ID, so Gatekeeper will block launches.
    If you trust the publisher, install with `brew install --cask --no-quarantine #{token}` or remove the quarantine
    attribute after installation with `xattr -dr com.apple.quarantine /Applications/Arto.app`.
  EOS
end
