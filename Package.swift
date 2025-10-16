// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftMosaic",
    platforms: [
        .iOS(.v15), .macOS(.v12)
    ],
    products: [
        .library(name: "SwiftCore", targets: ["SwiftCore"]),
        .library(name: "SwiftUICore", targets: ["SwiftUICore"]),
        .library(name: "SwiftUIHelpers", targets: ["SwiftUIHelpers"]),
    ],
    targets: [
        // SwiftCore: UIKit + logic
        .target(
            name: "SwiftCore",
            path: "Sources/SwiftCore"
        ),

        // SwiftUIHelpers: pure SwiftUI utilities
        .target(
            name: "SwiftUIHelpers",
            dependencies: [],
            path: "Sources/SwiftUIHelpers",
            linkerSettings: [
                .linkedFramework("SwiftUI")
            ]
        ),

        // SwiftUICore: architecture + view models
        .target(
            name: "SwiftUICore",
            dependencies: ["SwiftUIHelpers"],
            path: "Sources/SwiftUICore"
        ),

        // Tests
        .testTarget(
            name: "SwiftMosaicTests",
            dependencies: ["SwiftCore", "SwiftUICore", "SwiftUIHelpers"]
        )
    ]
)
