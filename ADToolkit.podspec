#
#  Be sure to run `pod spec lint ADToolkit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "ADToolkit"
  s.version      = "0.0.1"
  s.summary      = "Some useful categories"
  s.homepage     = "https://github.com/aidenluo177/ADToolkit"
  s.license      = "BSD"
  s.author             = { "aidenluo" => "aidenluo177@gmail.com" }
  s.source       = { :git => "https://github.com/aidenluo177/ADToolkit.git", :tag => "0.0.1" }
  s.source_files  = "ADToolkit/*.{h,m}"
  s.public_header_files = "ADToolkit/ADToolkit.h"
  s.requires_arc = false
end
