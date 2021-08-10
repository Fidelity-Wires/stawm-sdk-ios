# stawm-sdk-ios
Stawm SDK for iOS

| Name |  |
| --- | --- |
|StawmServiceStatus|It acquires the operational status of third party services and switches between pre-defined actions in the iOS app according to each status.|

# Installation

## Swift Package Manager
1. Open your Xcode project
2. File > Swift Packages > Add Package Dependency
3. Add `https://github.com/FidelityWires/stawm-sdk-ios`
4. Select "Up to Next Major"

## CocoaPods

```
pod 'StawmServiceStatus'
```

## Download the XCFrameworks from [Releases](https://github.com/FidelityWires/stawm-sdk-ios/releases)

- [StawmServiceStatus.xcframework](https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmServiceStatus.xcframework.zip)

1. Download and unzip files
2. Add the needed framework binaries to your project directory
3. Open your Xcode project
4. Select target's General tab
4. Drag the framework binaries to your **Frameworks, Libraries, and Embedded Content** section

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

