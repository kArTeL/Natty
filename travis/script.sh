#!/bin/sh
#bundle exec fastlane test && bundle exec fastlane report_test_coverage
set -o pipefail
#xcodebuild -version
#xcodebuild -showsdks
fastlane test
#bundle exec pod install
#xcodebuild -workspace erp.xcworkspace -scheme erp -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone X" ONLY_ACTIVE_ARCH=YES -enableCodeCoverage YES test | xcpretty -c
