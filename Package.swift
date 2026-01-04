// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIBlocks",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .watchOS(.v9),
        .tvOS(.v16)
    ],
    products: [
        .library(
            name: "SwiftUIBlocks",
            targets: ["SwiftUIBlocks"]
        ),
    ],
    targets: [
        .target(
            name: "SwiftUIBlocks",
            dependencies: [],
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
        .testTarget(
            name: "SwiftUIBlocksTests",
            dependencies: ["SwiftUIBlocks"]
        ),
    ]
)
