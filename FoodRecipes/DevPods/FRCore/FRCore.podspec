#
# Be sure to run `pod lib lint FRCore.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FRCore'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FRCore.'

  s.homepage         = 'https://github.com/dtrognn/FRCore'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dtrognn' => 'dtrognn@gmail.com' }
  s.source           = { :git => 'https://github.com/dtrognn/FRCore.git', :tag => s.version.to_s }

  s.ios.deployment_target = '16.0'

  s.source_files = 'FRCore/**/*.{swift,h,m}'
end
