// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let url = "https://github.com/FidelityWires/stawm-sdk-ios/releases/download/v0.8.9"
let serviceStatusChecksum = "b9caeff27deb36cc092bea19b55c2f768319625d11672c300f540c8ef05ce5f4"

let package = Package(
    name: "stawm-sdk-ios",
    platforms: [
        .iOS("10.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "StawmServiceStatus",
            targets: ["StawmServiceStatus"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(
            name: "StawmServiceStatus",
            url: "\(url)/StawmServiceStatus.xcframework.zip",
            checksum: serviceStatusChecksum
        ),
        .testTarget(
            name: "PackageTests",
            dependencies: [
                "StawmServiceStatus",
            ]),
    ]
)
