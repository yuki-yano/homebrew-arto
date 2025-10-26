cask "arto" do
  version "0.2.0"
  sha256 "8c4d4fe035ab9927f7c0021e06b31bb24a1fb5b42397c52d8ba7e1a4e41d5dad"

  url "https://github.com/lambdalisue/rs-arto/releases/download/v#{version}/Arto_0.1.0_aarch64.dmg",
      verified: "github.com/lambdalisue/rs-arto/"
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
