Pod::Spec.new do |spec|
  spec.name = "StawmServiceStatus"
  spec.version = "0.8.9"
  spec.summary = "It acquires the operational status of third party services and switches between pre-defined actions in the iOS app according to each status."
  spec.homepage = "https://github.com/FidelityWires/stawm-sdk-ios"
  spec.license = "See https://github.com/FidelityWires/stawm-sdk-ios/blob/master/LICENSE"
  spec.author = "Fidelity Wires Inc."
  spec.swift_versions = ['5.0', '5.1', '5.2']
  spec.ios.deployment_target = "10.0"
  spec.source = { :http => 'https://github.com/FidelityWires/stawm-sdk-ios/releases/download/v0.8.9/StawmServiceStatus.xcframework.zip' }
  spec.ios.vendored_frameworks = 'StawmServiceStatus.xcframework'
end
