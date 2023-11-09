// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SBCodableWrappers",
    platforms: [
        .iOS(.v11),
    ],
    products: [
        .library(name: "SBCodableWrappers", targets: ["SBCodableWrappers"]),
    ],
    targets: [
        .target(name: "SBCodableWrappers", path: "Sources"),
    ],
    swiftLanguageVersions: [
        .v5,
    ]
)
