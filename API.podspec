#
# Be sure to run `pod lib lint API.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'API'
  s.version          = '0.1.1'
  s.summary          = 'An AFNetworking wrapper for easy API creation'

  s.description      = <<-DESC
API is a wrapper for the AFNetworking framework by AlamoFire. This wrapper makes it easier to make a clean GET, POST, PUT, and DELETE API requests without having to worry about setting up the methods every time. This library started off as a means for me to be able to initialize my API on my applications quicker, and I look forward to adding functionality to make it extra helpful to others.
                       DESC

  s.homepage         = 'https://github.com/andrewboryk/API'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrewboryk' => 'andrewcboryk@gmail.com' }
  s.source           = { :git => 'https://github.com/andrewboryk/API.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/TrepIsLife'

  s.ios.deployment_target = '8.0'

  s.source_files = 'API/Classes/**/*'
  
  # s.resource_bundles = {
  #   'API' => ['API/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AFNetworking'
end
