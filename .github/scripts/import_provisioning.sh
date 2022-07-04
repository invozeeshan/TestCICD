#!/bin/bash

security create-keychain -p build.keychain
security import provisioning/AppStoreCertificate.p12 -t agg \ -k ~/Library/keychains/build.keychain -p "$PROVISIONING_PROFILE_DATA" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p  "" ~/Library/Keychains/build.keychain
security set-key-partition-list -S apple-tool:,apple: -s \ -k "" ~/Library/Keychains/build.keychain
