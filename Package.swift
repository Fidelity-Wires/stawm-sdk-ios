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
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmNetstatus.xcframework.zip",
            checksum: "055ac2cd6dc31ead570b713c53a28a63cf4ff4abf58c92ae5c163e1f8b695891"),
        .binaryTarget(
            name: "StawmTraceroute",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmTraceroute.xcframework.zip",
            checksum: "d3153b5b8844fb1c97763fe2b1ed58137e6fff5a525d0762ca4278319b26181b"),
        .binaryTarget(
            name: "StawmSpeedTest",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmSpeedTest.xcframework.zip",
            checksum: "c426506aae64bfc25ee424c158ec61db7d727a928dddf77274e0a92d379aeadc"),
        .binaryTarget(
            name: "StawmServiceStatus",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmServiceStatus.xcframework.zip",
            checksum: "ee1316ae1ce00a897bb3d2f354622c55fe1e1ba3220f7fc3429c711dfb87315b"),    ]
)
