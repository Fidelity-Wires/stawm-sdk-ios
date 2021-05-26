Pod::Spec.new do |spec|
  spec.name = "StawmTraceroute"
  spec.version = "0.8.8"
  spec.summary = "Measure the speed and ping of the network that the iOS app is using."
  spec.homepage = "https://github.com/FidelityWires/stawm-sdk-ios"
  spec.license = "See https://github.com/FidelityWires/stawm-sdk-ios/blob/master/LICENSE"
  spec.author = "Fidelity Wires Inc."
  spec.swift_versions = ['5.0', '5.1', '5.2']
  spec.ios.deployment_target = "10.0"
  spec.source = { :http => 'https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmTraceroute.xcframework.zip' }
  spec.ios.vendored_frameworks = 'StawmTraceroute.xcframework'
end
