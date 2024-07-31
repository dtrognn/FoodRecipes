#
# Be sure to run `pod lib lint FRAPILayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FRAPILayer'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FRAPILayer.'

  s.homepage         = 'https://github.com/dtrognn/FRAPILayer'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dtrognn' => 'dtrognn@gmail.com' }
  s.source           = { :git => 'https://github.com/dtrognn/FRAPILayer.git', :tag => s.version.to_s }

  s.ios.deployment_target = '16.0'

  s.source_files = 'FRAPILayer/**/*.{swift,h,m}'

  s.dependency 'FRCore'
end
