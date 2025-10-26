# Arto Cask (yuki-yano/homebrew-arto)

This tap ships a Homebrew Cask that installs the Arto DMG distributed upstream in [`lambdalisue/rs-arto`](https://github.com/lambdalisue/rs-arto).

## Installation

```bash
brew tap yuki-yano/arto
brew install --cask --no-quarantine yuki-yano/arto/arto
```

### Why `--no-quarantine` is recommended

- Upstream artifacts are not Apple Developer ID-signed nor notarized.
- Homebrew normally applies the `com.apple.quarantine` extended attribute to downloaded files, which causes Gatekeeper to block the first launch of unsigned apps.
- Passing `--no-quarantine` prevents Homebrew from setting that attribute, letting you launch immediately. Only do this if you trust the upstream build.

### If the quarantine attribute already exists

`--no-quarantine` only affects newly downloaded files. If an existing install already has the quarantine attribute, either remove the cached download and reinstall, or strip the attribute manually:

```bash
# Remove cached DMGs and reinstall
rm -rf ~/Library/Caches/Homebrew/downloads/*arto*
brew reinstall --cask --no-quarantine yuki-yano/arto/arto

# Or remove the quarantine attribute from an existing app
xattr -dr com.apple.quarantine /Applications/Arto.app
```

## Manual verification

If you want to double-check the artifact, use:

```bash
# Verify the DMG checksum
shasum -a 256 ~/Library/Caches/Homebrew/downloads/*Arto*.dmg

# Inspect the code signature
codesign -dv --verbose=4 /Applications/Arto.app
```

You will see `Signature=adhoc`, confirming there is no Developer ID signature or notarization. Install and run it at your own discretion.

## Upgrades

```bash
brew update
brew upgrade --cask --no-quarantine yuki-yano/arto/arto
```

Homebrew may reapply the quarantine on upgrades. If Gatekeeper blocks the app afterward, run `xattr -dr com.apple.quarantine /Applications/Arto.app` again.
