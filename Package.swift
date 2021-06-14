// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "XCUITestHelpers",
    platforms: [ .iOS(.v13) ],
    products: [
        .library(name: "XCUITestHelpers", targets: ["XCUITestHelpers"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "XCUITestHelpers",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "XCUITestHelpersTests",
            dependencies: ["XCUITestHelpersTests"],
            exclude: ["Info.plist"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
