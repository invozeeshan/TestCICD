#!/bin/bash

set -eo pipefail

xcodebuild -project TestApp.xcodeproj \
            -scheme TestApp \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/TestApp.xcarchive \
            clean archive | xcpretty
