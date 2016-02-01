#
# Be sure to run `pod lib lint leads-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "leads-sdk"
  s.version          = "0.1.0"
  s.summary          = "Collect leads in Salesforce Sales Cloud from any native iOS apps."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
			An easy to use embeddable button to let you collect leads in Salesforce from any native iOS app.
                       DESC

  s.homepage         = "https://github.com/quintonwall/leads-sdk"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Quinton Wall" => "qwall@salesforce.com" }
  s.source           = { :git => "https://github.com/quintonwall/leads-sdk.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/quintonwall>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'leads-sdk' => ['Pod/Assets/*.png', 'leads-sdk/Pod/Classes/leadsBackground.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
