// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OrderingEntities",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "OrderingEntities",
            targets: ["OrderingEntities"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(path: "../OrderingUtilities")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "OrderingEntities",
            dependencies: ["OrderingUtilities"]),
        .testTarget(
            name: "OrderingEntitiesTests",
            dependencies: ["OrderingEntities"]),
    ]
)
