// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalStorage",
    platforms: [
        .iOS(.v16),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "LocalStorage",
            targets: ["LocalStorage"]),
    ],
    targets: [
        .target(
            name: "LocalStorage",
            path: "Sources/LocalStorage"
        ),
        .testTarget(
            name: "LocalStorageTests",
            dependencies: ["LocalStorage"],
            path: "Tests/LocalStorageTests"
        ),
    ]
)
