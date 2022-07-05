#!/bin/bash
#!/bin/sh


set -euo pipefail

echo $SIGNING_CERTIFICATE_P12_DATA >> certificate.txt
echo $SIGNING_CERTIFICATE_PASSWORD >> password.txt
cat certificate.txt
cat password.txt

security create-keychain -p "" build.keychain
security list-keychains -s build.keychain
security default-keychain -s build.keychain
security unlock-keychain -p "" build.keychain
security set-keychain-settings
security import <(echo "${SIGNING_CERTIFICATE_P12_DATA}" | base64 --decode) \
                -f pkcs12 \
                -k build.keychain \
                -P "${SIGNING_CERTIFICATE_PASSWORD}" \
                -T /usr/bin/codesign
security set-key-partition-list -S apple-tool:,apple: -s -k "" build.keychain


#set -eo pipefail

#echo "${IOS_KEYS} IOS Keys"
#gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/CICD_Test__Release.mobileprovision.mobileprovision ./.github/secrets/#CICD_Test__Release.mobileprovision.gpg
#gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/HippocratesTech_Release.p12 ./.github/secrets/HippocratesTech_Release.p12.gpg

#mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles


#cp ./.github/secrets/CICD_Test__Release.mobileprovision.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/CICD_Test__Release.mobileprovision.mobileprovision

#security create-keychain -p "" build.keychain
#security import ./.github/secrets/HippocratesTech_Release.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

#security list-keychains -s ~/Library/Keychains/build.keychain
#security default-keychain -s ~/Library/Keychains/build.keychain
#security unlock-keychain -p "" ~/Library/Keychains/build.keychain

#security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
