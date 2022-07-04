#!/bin/bash

set -eo pipefail

xcrun altool --upload-app -t ios -f build/TestApp\ iOS.ipa -u "$APP_STORE_CONNECT_USERNAME" -p "$APP_STORE_CONNECT_PASSWORD" --verbose
