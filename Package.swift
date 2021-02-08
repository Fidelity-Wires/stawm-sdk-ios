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
            checksum: "67c59473b0967de771805d27c51449c50563a5703dba4fe2326722039ebd0ae3"),
        .binaryTarget(
            name: "StawmTraceroute",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmTraceroute.xcframework.zip",
            checksum: "2418b8495d98e85134d9101562ebb8190ba70ade8c00dc28b00071a75ea5c964"),
        .binaryTarget(
            name: "StawmSpeedTest",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmSpeedTest.xcframework.zip",
            checksum: "afec7fa6e12f61bea1571dd72cc433c38cdc9b1fb256a81fa03cad191031492d"),
        .binaryTarget(
            name: "StawmServiceStatus",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmServiceStatus.xcframework.zip",
            checksum: "05acd3f363af98c08089359c68c77b14f351c9639ee03fd42098033df58250ff"),    ]
)
