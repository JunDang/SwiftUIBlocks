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
