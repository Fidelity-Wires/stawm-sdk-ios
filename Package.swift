// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = "0.8.8"
let url = "https://github.com/FidelityWires/stawm-sdk-ios/releases/download/\(version)/"
let netstatusChecksum = "2f3f80ec65b66fdf30aa54af6569032b60624df51ff92831905327f48706f1a3"
let tracerouteChecksum = "101c659df34d910670e9bbcb376bcec2eee3c45e33e36442e78b1710a26730bd"
let speedTestChecksum = "ccd8b013aec98ef1e91a41db2e473f7514412ce11c641536cebaa288cfc2436e"
let serviceStatusChecksum = "d07e0971b45d48ad9d063130d0c997f8d5215758fe4b5e8008521de10b59e435"

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
            url: "\(url)/StawmNetstatus.xcframework.zip",
            checksum: netstatusChecksum
        ),
        .binaryTarget(
            name: "StawmTraceroute",
            url: "\(url)/StawmTraceroute.xcframework.zip",
            checksum: tracerouteChecksum
        ),
        .binaryTarget(
            name: "StawmSpeedTest",
            url: "\(url)/StawmSpeedTest.xcframework.zip",
            checksum: speedTestChecksum
        ),
        .binaryTarget(
            name: "StawmServiceStatus",
            url: "\(url)/StawmServiceStatus.xcframework.zip",
            checksum: serviceStatusChecksum
        ),
    ]
)
