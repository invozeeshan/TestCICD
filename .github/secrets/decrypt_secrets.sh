#!/bin/bash
#!/bin/sh
set -eo pipefail


gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/match_appstore_TextApp_profile.mobileprovision ./.github/secrets/match_appstore_TextApp_profile.gpg
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles


cp ./.github/secrets/match_appstore_TextApp_profile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/match_appstore_TextApp_profile.mobileprovision

security create-keychain -p $1234 build.keychain
security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P $1234 -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p $1234 ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "1234" ~/Library/Keychains/build.keychain
