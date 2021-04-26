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
            checksum: "0b232ee795818272b401b502a690f1604c9e5073fe382c5cfb597fa72560f719"),
        .binaryTarget(
            name: "StawmTraceroute",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmTraceroute.xcframework.zip",
            checksum: "0b7a23b60da98fd1bb2d0713e8421367bde7b89bf182631b6a1faeff0608e363"),
        .binaryTarget(
            name: "StawmSpeedTest",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmSpeedTest.xcframework.zip",
            checksum: "f36be5f12f9834f13fe2748ed257cf2a7bd9b3f23608dad6c486fc07ce8dc431"),
        .binaryTarget(
            name: "StawmServiceStatus",
            url: "https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmServiceStatus.xcframework.zip",
            checksum: "6925b9e17d9309295082c935ca3da97049617971bce78a4b9fbcf11fe5dac0a3"),    ]
)
