#!/bin/bash

set -eo pipefail

xcodebuild -project TestApp.xcodeproj \
            -scheme TestApp
            -destination platform=iOS\ Simulator,OS=13.3,name=iPhone\ 11 \
            clean test | xcpretty
