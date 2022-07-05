#!/bin/bash

set -eo pipefail

#xcodebuild -project TestApp.xcodeproj -scheme TestApp \
#        -archivePath build/TestApp.xcarchive archive \
#        PROVISIONING_PROFILE="$uuid" CODE_SIGN_IDENTITY="HippocratesTech_Release"


xcodebuild -project TestApp.xcodeproj \
            -scheme TestApp \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/TestApp.xcarchive \
            clean archive | xcpretty
