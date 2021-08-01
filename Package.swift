// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ISO8601DurationFormatter",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ISO8601DurationFormatter",
            targets: ["ISO8601DurationFormatter"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ISO8601DurationFormatter",
            dependencies: []),
        .testTarget(
            name: "ISO8601DurationFormatterTests",
            dependencies: ["ISO8601DurationFormatter"]),
    ]
)
