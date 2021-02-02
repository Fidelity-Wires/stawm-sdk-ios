# stawm-sdk-ios
Stawm SDK for iOS

| Name |  |
| --- | --- |
|StawmServiceStatus|It acquires the operational status of third party services and switches between pre-defined actions in the iOS app according to each status.|
|StawmSpeedTest|Measure the internet speed or ping used by the iOS app and send the results to the specified destination.|
|StawmNetstatus|It collects various data about the network used by the iOS app and sends the results to the specified destination.|
|StawmTraceroute|Measure the speed and ping of the network that the iOS app is using.|

```
┌────────────────────┐    ┌────────────────────┐    ┌────────────────────┐
│ StawmServiceStatus │    │   StawmSpeedTest   │    │   StawmNetstatus   │
└────────────────────┘    └──────────┬─────────┘    └──────────┬─────────┘
                                     │                         │        
                          ┌──────────▼─────────────────────────▼─────────┐
                          │               StawmTraceroute                │
                          └──────────────────────────────────────────────┘
```

# Installation

## Swift Package Manager
1. Open your Xcode project
2. File > Swift Packages > Add Package Dependency
3. Add `https://github.com/FidelityWires/stawm-sdk-ios`
4. Select "Up to Next Major" with "0.8.6"

## CocoaPods
Currently not supported.

## Download the XCFrameworks from [Releases](https://github.com/FidelityWires/stawm-sdk-ios/releases)

- [StawmNetstatus.xcframework](https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmNetstatus.xcframework.zip)
- [StawmServiceStatus.xcframework](https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmServiceStatus.xcframework.zip)
- [StawmSpeedTest.xcframework](https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmSpeedTest.xcframework.zip)
- [StawmTraceroute.xcframework](https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmTraceroute.xcframework.zip)

1. Download and unzip files
2. Add the needed framework binaries to your project directory
3. Open your Xcode project
4. Select target's General tab
4. Drag the framework binaries to your **Frameworks, Libraries, and Embedded Content** section

# Usage


# Debugging

## StawmServiceStatus

1. Open your Xcode project
2. Product > Scheme > Edit Scheme
3. Set `-STAWNDebugEnabled` as `Aguments Passed On Launch`
4. Add the following code

```
let serviceStatusInspector = ServiceStatusInspector()

let _ = serviceStatusInspector
    .setDebug(settings: [
        .init(service: .googlePlus, status: .red),
        .init(service: .googleCalendar, status: .red),
        .init(service: .googleMaps, status: .red),
    ])
```

