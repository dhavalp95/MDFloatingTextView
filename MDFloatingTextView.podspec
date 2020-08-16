#
# Be sure to run `pod lib lint MDFloatingTextView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MDFloatingTextView'
  s.version          = '0.1.0'
  s.summary          = 'MDFloatingTextView is beautyfull presentation of floating lable on textview'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'MDFloatingTextView is a beautiful, flexible and customizable implementation of the space saving Float Label with textview. This design enables adding context to input fields that are visible at the time of typing, while minimizing the additional space used to display this additional context.'
                        DESC
  s.homepage         = 'https://github.com/dhavalp95/MDFloatingTextView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dhaval' => 'patoliyadhaval555@gmail.com' }
  s.source           = { :git => 'https://github.com/dhavalp95/MDFloatingTextView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/**/*.swift'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "12.0"
  }
  # s.resource_bundles = {
  #   'MDFloatingTextView' => ['MDFloatingTextView/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
