// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Anim",
    platforms: [.iOS(.v11), .tvOS(.v11), .macOS(.v10_13), .watchOS(.v7)],
    products: [
        .library(
            name: "Anim",
            targets: ["Anim"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Anim",
            dependencies: []
        ),
        .testTarget(
            name: "AnimTests",
            dependencies: ["Anim"]
        )
    ]
)
