#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/TestApp.xcarchive \
            -exportOptionsPlist TestCICD/TestApp\ iOS/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
