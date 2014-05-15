#
#  Be sure to run `pod spec lint SVGKit.podspec' to ensure this is a
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

  s.name         = "SVGKit"
  s.version      = "1.1.3"
  s.summary      = "SVGKit is a Cocoa framework for rendering SVG files natively: it's fast and powerful."

  s.description  = <<-DESC
				   SVGKit is a Cocoa framework for rendering SVG files natively: it's fast and powerful.

				   Versions:
				   v1.0 - 2013, approximately 90% coverage of the SVG spec. Stable and quite fast - https://github.com/SVGKit/SVGKit/tree/v1.0
				   v1.1.0 - Current branch in development; all pull-requests should be issued against this branch - https://github.com/SVGKit/SVGKit/tree/1.1.0
                   DESC

  s.homepage     = "https://github.com/SVGKit/SVGKit/tree/1.1.0"
  # s.screenshots  = "www.example.com/screenshots_1", "www.example.com/screenshots_2"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See http://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  s.license      = 'MIT (example)'
  # s.license      = { :type => 'MIT', :file => 'FILE_LICENSE' }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors by using the SCM log. E.g. $ git log. If no email can be
  #  found CocoaPods accept just the names.
  #

  s.author       = { "Matt Rajca" => "matt.rajca@me.com" }


  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # s.platform     = :ios
  # s.platform     = :ios, '5.0'

  #  When using multiple platforms
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, svn and HTTP.
  #

  s.source       = { :git => "https://github.com/macteo/SVGKit.git", :tag => s.version.to_s }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it include source code, for source files
  #  giving a folder will include any h, m, mm, c & cpp files. For header
  #  files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #
  #s.ios.source_files = 'Core/**/*.{h,m}', 'iOS/**/*.{h,m}'
  #s.osx.source_files = 'Core/**/*.{h,m}', 'Mac/**/*.{h,m}', 'iOS/CAShapeLayerWithHitTest.{h,m}', 'iOS/CALayerWithChildHitTest.{h,m}'
  
  s.source_files  = 'Source', 'Source/**/*.{h,m}'
  s.ios.exclude_files = "Source/AppKit additions/*.{h,m}"
  s.osx.exclude_files = "Source/UIKit additions/*.{h,m}"
  # s.public_header_files = 'Classes/**/*.h'


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = 'SomeFramework'
  s.ios.frameworks = 'CoreText', 'CoreImage', 'QuartzCore', 'CoreGraphics', 'UIKit'
  s.osx.frameworks = 'CoreText', 'QuartzCore', 'CoreGraphics'

  s.library   = 'xml2'

  s.requires_arc = false

  s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }
  s.dependency 'CocoaLumberjack', '~> 1.6.2'
  s.prefix_header_file = 'XCodeProjectData/SVGKit-iOS/SVGKit-iOS-Prefix.pch' # For lumberjack
end
