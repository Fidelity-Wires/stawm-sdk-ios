# taqion-sdk-ios
Taqion SDK for iOS

## Integration

### 1. Add a line to `Cartfile`

```console
$ git "git@github.com:FidelityWires/tachyon-sdk-swift.git" "v0.7.4"
```

### 2. Add frameworks to setting

Add frameworks to  `Build Phases > Link Binary With Libraries` below:

```
Taqion.framework
TaqionTraceroute.framework
TaqionNetstatus.framework
TaqionSpeedtest.framework
```

### 3. Add run script

Add copy-frameworks to `Build Phases > RunScript` below:

```
/usr/local/bin/carthage copy-frameworks

$(SRCROOT)/Carthage/Build/iOS/Taqion.framework
$(SRCROOT)/Carthage/Build/iOS/TaqionNetstatus.framework
$(SRCROOT)/Carthage/Build/iOS/TaqionTraceroute.framework
$(SRCROOT)/Carthage/Build/iOS/TaqionSpeedTest.framework
```