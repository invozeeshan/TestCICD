#!/bin/bash

set -eo pipefail

xcodebuild -project TestApp.xcodeproj \
            -scheme TestApp\ iOS \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/TestApp.xcarchive \
            clean archive | xcpretty
