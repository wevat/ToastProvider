#
# Be sure to run `pod lib lint ToastProvider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ToastProvider'
  s.version          = '1.0.0'
  s.summary          = 'Providing your app with Toast messages.'

  s.description      = 'A simple Toast provider library, to provide your app with some temporary information in an eye pleasing fashion. It can show a title, an optional subtitle, and also an optional image.'

  s.homepage         = 'https://github.com/wevat/ToastProvider.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'harryblam' => 'harry@wevat.com' }
  s.source           = { :git => 'https://github.com/harryblam/ToastProvider.git', :tag => s.version.to_s }
  
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.1'

  s.source_files = 'ToastProvider/Classes/**/*'
  
  s.resource_bundles = {
      'ToastProvider' => ['ToastProvider/**/*.{xib,png,xcassets}']
  }
end
