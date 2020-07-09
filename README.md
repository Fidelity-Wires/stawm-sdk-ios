# taqion-sdk-ios
Taqion SDK for iOS

## Integration

### 1. Add a line to `Cartfile`

```Cartfile
git "git@github.com:FidelityWires/taqion-sdk-ios.git" "v0.7.6"
```

### 2. Add frameworks to setting

Add frameworks to  `Build Phases > Link Binary With Libraries` below:

```
Taqion.framework
TaqionCore.framework
TaqionTraceroute.framework
TaqionNetstatus.framework
TaqionSpeedtest.framework
```

### 3. Add run script

Add copy-frameworks to `Build Phases > RunScript` below:

```
/usr/local/bin/carthage copy-frameworks

$(SRCROOT)/Carthage/Build/iOS/Taqion.framework
$(SRCROOT)/Carthage/Build/iOS/TaqionCore.framework
$(SRCROOT)/Carthage/Build/iOS/TaqionNetstatus.framework
$(SRCROOT)/Carthage/Build/iOS/TaqionTraceroute.framework
$(SRCROOT)/Carthage/Build/iOS/TaqionSpeedTest.framework
```

## Debugging
### 1. Add debug mode setting.
**Product -> Scheme -> Edit Scheme** and set `-STAWNDebugEnabled` as `Aguments Passed On Launch`
### 2. Add code

 ```
let serviceStatusInspector = ServiceStatusInspector()

let _ = serviceStatusInspector
    .setDebug(settings: [
        .init(service: .googlePlus, isAvailable: false),
        .init(service: .googleCalendar, isAvailable: false),
        .init(service: .googleMaps, isAvailable: false),
    ])
 ```

## Running Example App
### To run the example app:
1. Download `Carthage.framework.zip` from [latest release](https://github.com/FidelityWires/taqion-sdk-ios/releases)
2. Run `$ unzip Taqion.framework.zip # output Carthage directory`
3. Run `$ mv Carthage path/to/taqion-sdk-ios/Example/`
4. Open `Example.xcodeproj`
5. Build and run the project