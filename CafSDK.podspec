Pod::Spec.new do |s|
  s.name             = 'CafSDK'
  s.version          = '1.0.0'
  s.summary          = 'Caf iOS SDK'
  s.homepage         = 'https://github.com/combateafraude/caf-ios-sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Caf' => 'service@caf.com' }
  s.source           = { :git => 'https://github.com/combateafraude/caf-ios-sdk.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  
  s.default_subspec = 'Core'
  
  s.subspec 'Core' do |core|
    core.dependency 'CafSDK/DocumentDetector'
    core.dependency 'CafSDK/CafFaceLiveness'
  end
  
  s.subspec 'DocumentDetector' do |dd|
    dd.vendored_frameworks = 'Frameworks/DocumentDetector.xcframework'
    dd.dependency 'TensorFlowLiteC', '2.14.0'
    dd.dependency 'CafSolutions', '1.0.1'
  end

  s.subspec 'CafFaceLiveness' do |cl|
    cl.dependency 'CafSDK/CafFaceLivenessCore' 
    cl.dependency 'CafSDK/IproovProvider' 
    cl.dependency 'CafSDK/FaceTec2DProvider' 
  end
  
  s.subspec 'CafFaceLivenessCore' do |fl|
    fl.vendored_frameworks = 'Frameworks/CafFaceLiveness.xcframework'
    fl.dependency 'FingerprintPro', '2.6.0'
    fl.dependency 'CafSolutions', '1.0.1'
  end
  
  s.subspec 'IproovProvider' do |ip|
    ip.vendored_frameworks = 'Frameworks/IproovProvider.xcframework'
    ip.dependency 'iProov', '12.2.1'
    ip.dependency 'CafSDK/CafFaceLivenessCore' 
  end

  s.subspec 'FaceTec2DProvider' do |fp|
    fp.vendored_frameworks = 'Frameworks/FaceTec2DProvider.xcframework'  
    fp.dependency 'CafSDK/CafFaceLivenessCore'
  end
end
