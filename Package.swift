// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "NavigatableCollection",
    platforms: [
      .iOS(.v13),
    ],
    products: [
        .library(
            name: "NavigatableCollection",
            targets: ["NavigatableCollection"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NavigatableCollection",
            dependencies: []),
        .testTarget(
            name: "NavigatableCollectionTests",
            dependencies: ["NavigatableCollection"]),
    ]
)
