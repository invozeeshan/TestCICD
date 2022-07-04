#!/bin/bash

set -eo pipefail

xcodebuild -workspace TestApp.xcworkspace \
            -scheme TestApp\ iOS \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/TestApp.xcarchive \
            clean archive | xcpretty
