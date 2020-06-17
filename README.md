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