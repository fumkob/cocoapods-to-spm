// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WatchView",
    platforms: [
        .watchOS(.v7)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "WatchView",
            type: .dynamic,
            targets: ["WatchView"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(path: "../UseCase"),
        .package(url: "https://github.com/crexista/UseCaseKit", branch: "add_adaptor"), // ここでUseCaseKitを呼ばないとBuildできない
        .package(url: "https://github.com/Swinject/Swinject", from: "2.8.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "WatchView",
            dependencies: [
                "UseCase",
                "UseCaseKit",
                "Swinject"
            ]),
        .testTarget(
            name: "WatchViewTests",
            dependencies: ["WatchView"]),
    ]
)
