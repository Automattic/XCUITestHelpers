#!/bin/bash -eu

# Notice that:
#
# - We are using raw `xcodebuild` without extra tooling such as Fastlane,
#   `xcpretty`, or `xcbeautify`. This is an intentional compromise to keep the
#   setup lean, as adding any of those would require extras in CI such as
#   chating for what, right now, looks like merely a log readability gain.
#
# - The iOS Simulator version is hardcoded in the command call, unlike the
#   Simulator device, so we have a single source of truth. The downside is that
#   the syntax in the pipeline is less clear: a reader might as where's the
#   iOS version set. As long as we only need to test against the latest iOS
#   version, that seems like a reasonable tradeoff to make it easier to move to
#   newer versions as they are released.
SIMULATOR_NAME=$1

xcodebuild clean test \
  -project 'XCUITestHelpers.xcodeproj' \
  -scheme 'XCUITestHelpers' \
  -destination "platform=iOS Simulator,name=$SIMULATOR_NAME,OS=14.5"
