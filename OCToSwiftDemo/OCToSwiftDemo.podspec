#
# Be sure to run `pod lib lint OCToSwiftDemo.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OCToSwiftDemo'
  s.version          = '0.1.0'
  s.summary          = 'OCToSwift'
  s.description      = 'this is OCToSwift sdk'
  
  s.ios.deployment_target = '8.0'
  s.homepage         = 'https://github.com/eastzhou'
  s.author           = { 'eastzhou' => 'aitazzd@126.com' }
  s.source           = { :git => 'https://github.com/eastzhou'}
  
  s.source_files = 'OCToSwiftDemo/Classes/**/*.{h,m}'
  s.resource_bundles = {
    'PPTVCorePlayer' => ['OCToSwiftDemo/Assets/*']
  }
  
  s.public_header_files = 'Pod/Classes/*'
  
  s.subspec 'OC' do |ss|
    ss.source_files = 'Classes/OC/**/*'
    
    ss.dependency 'Masonry'
    ss.dependency 'AFNetworking'
    ss.dependency 'YYKit'
    ss.dependency 'SDWebImage'
  end
  
  s.subspec 'Logger' do |ss|
    ss.source_files = 'Classes/Logger/**/*'
    
    ss.dependency 'CocoaLumberjack'
  end
end
