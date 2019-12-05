#
#  Be sure to run `pod spec lint BLAPIManagers.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "A_Swift"
  s.version      = "0.0.1"
  s.summary      = "A_Swift."

  s.description  = <<-DESC
                    this is A_Swift
                   DESC

  s.homepage     = "https://github.com/qiangjindong/A_Swift"

  s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "QJD" => "qiangjindong@163.com" }
  
  s.platform     = :ios, "9.0"


  s.source       = { :git => "https://github.com/qiangjindong/A_Swift.git", :tag => s.version.to_s }

  s.source_files  = "A_Swift/A_Swift/**/*.{h,m,swift}"

  s.requires_arc = true
  
  s.static_framework = true
  
  s.dependency 'SwiftMessages', '~> 6.0'
  
  s.dependency 'CMJDPay'

end
