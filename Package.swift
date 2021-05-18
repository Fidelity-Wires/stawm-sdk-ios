// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "stawm-sdk-ios",
    platforms: [
        .iOS("10.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "StawmNetstatus",
            targets: ["StawmNetstatus"]),
        .library(
            name: "StawmTraceroute",
            targets: ["StawmTraceroute"]),
        .library(
            name: "StawmSpeedTest",
            targets: ["StawmSpeedTest"]),
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
            name: "StawmNetstatus",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/download/v0.8.9/StawmNetstatus.xcframework.zip",
            checksum: "142c51bbb293e8664267e164a1715f9974bb666884f852cfb02b1bc52f6bc2e5"),
        .binaryTarget(
            name: "StawmTraceroute",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/download/v0.8.9/StawmTraceroute.xcframework.zip",
            checksum: "281a8ba62bcfd1443007479bc47be1453a2acc4ad7e5681060731f3195bc3204"),
        .binaryTarget(
            name: "StawmSpeedTest",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/download/v0.8.9/StawmSpeedTest.xcframework.zip",
            checksum: "b55b687788f6bb44d56a987146ee761e5de09c851ad9c85272fb51fbf56784b8"),
        .binaryTarget(
            name: "StawmServiceStatus",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/download/v0.8.9/StawmServiceStatus.xcframework.zip",
            checksum: "17c536f77cd3e432f5f499baf6cc741ff069208673a43463b3476b9b59beda13"),    ]
)
