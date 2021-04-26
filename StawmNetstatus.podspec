Pod::Spec.new do |spec|
  spec.name         = "StawmNetstatus"
  spec.version      = "0.8.8"
  spec.summary      = "It collects various data about the network used by the iOS app and sends the results to the specified destination."
  spec.homepage     = "https://github.com/FidelityWires/stawm-sdk-ios"
  spec.license      = "See https://github.com/FidelityWires/stawm-sdk-ios/blob/master/LICENSE"
  spec.author       = "Fidelity Wires Inc."
  spec.swift_versions = ['5.0', '5.1', '5.2']
  spec.ios.deployment_target = "10.0"
  spec.source = { :http => 'https://github.com/FidelityWires/stawm-sdk-ios/releases/latest/download/StawmNetstatus.xcframework.zip' }
  spec.ios.vendored_frameworks = 'StawmNetstatus.xcframework'
  spec.dependency "StawmTraceroute", "~> 0.8.8"
end
