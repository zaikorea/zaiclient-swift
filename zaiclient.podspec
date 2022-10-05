#
# Be sure to run `pod lib lint zaiclient.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'zaiclient'
  s.version          = '0.1.0'
  s.summary          = 'It is a REST client SDK that allows you to easily use Z.Ai API in Swift environment.'

  s.homepage         = 'https://github.com/zaikorea/zaiclient-swift'
  s.license          = 'Proprietary'
  s.author           = { 'zaikorea' => 'tech@zaikorea.org' }
  s.source           = { :git => 'https://github.com/zaikorea/zaiclient-swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'

  s.source_files = 'Sources/zaiclient/Classes/**/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'Alamofire', '~> 5.2'
end
