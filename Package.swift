// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "UITestsHelpers",
    platforms: [ .iOS(.v13) ],
    products: [
        .library(name: "UITestsHelpers", targets: ["UITestsHelpers"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UITestsHelpers",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "UITestsHelpersTests",
            dependencies: ["UITestsHelpers"],
            exclude: ["Info.plist"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
