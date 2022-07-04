#!/bin/bash
#!/bin/sh
set -eo pipefail

echo "$IOS_KEYS"
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/CICD_Test__Release.mobileprovision.mobileprovision ./.github/secrets/CICD_Test__Release.mobileprovision.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/HippocratesTech_Release.p12 ./.github/secrets/HippocratesTech_Release.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles


cp ./.github/secrets/CICD_Test__Release.mobileprovision.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/CICD_Test__Release.mobileprovision.mobileprovision

security create-keychain -p "" build.keychain
security import ./.github/secrets/HippocratesTech_Release.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
