#!/bin/bash -eu

SIMULATOR_NAME=$1

xcodebuild clean test \
  -project 'XCUITestHelpers.xcodeproj' \
  -scheme 'XCUITestHelpers' \
  -destination "platform=iOS Simulator,name=$SIMULATOR_NAME,OS=14.5"
