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
    ],
    targets: [
        .target(name: "SwiftCore", path: "Sources/SwiftCore"),
        .target(name: "SwiftUICore", path: "Sources/SwiftUICore"),
        .testTarget(name: "SwiftMosaicTests", dependencies: ["SwiftCore", "SwiftUICore"])
    ]
)
