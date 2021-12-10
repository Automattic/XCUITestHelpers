// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "XCUITestHelpers",
    platforms: [ .iOS(.v13), .macOS(.v10_13) ],
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
            dependencies: ["XCUITestHelpers"],
            exclude: ["Info.plist"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
