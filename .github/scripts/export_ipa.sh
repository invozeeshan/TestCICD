#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/TestApp.xcarchive \
            -exportOptionsPlist TestApp/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
