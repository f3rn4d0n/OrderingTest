// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OrderingDesignSystem",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OrderingDesignSystem",
            targets: ["OrderingDesignSystem"]),
    ],
    dependencies: [
        .package(url: "https://github.com/lorenzofiamingo/swiftui-cached-async-image", .upToNextMajor(from: "2.1.1"))
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OrderingDesignSystem",
            dependencies: [
                .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image")
            ]),
        .testTarget(
            name: "OrderingDesignSystemTests",
            dependencies: [
                "OrderingDesignSystem",
                .product(name: "CachedAsyncImage", package: "swiftui-cached-async-image")
            ]),
    ]
)
