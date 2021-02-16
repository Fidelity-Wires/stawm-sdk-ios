Pod::Spec.new do |spec|
  spec.name         = "StawmSpeedTest"
  spec.version      = "0.8.7"
  spec.summary      = "Measure the internet speed or ping used by the iOS app and send the results to the specified destination."
  spec.homepage     = "https://github.com/FidelityWires/stawm-sdk-ios"
  spec.license      = "See https://github.com/FidelityWires/stawm-sdk-ios/blob/master/LICENSE"
  spec.author       = "Fidelity Wires Inc."
  spec.swift_versions = ['5.0', '5.1', '5.2']
  spec.ios.deployment_target = "10.0"
  spec.source = { :http => 'https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmSpeedTest.xcframework.zip' }
  spec.ios.vendored_frameworks = 'StawmSpeedTest.xcframework'
  spec.dependency "StawmTraceroute", "~> 0.8.7"
end
