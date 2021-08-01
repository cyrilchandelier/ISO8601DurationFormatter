#
#  Be sure to run `pod spec lint ISO8601DurationFormatter.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.name         = "ISO8601DurationFormatter"
  spec.version      = "0.0.1"
  spec.summary      = "A Swift formatter to support the duration part of the ISO8601 standard."
  spec.description  = <<-DESC
  A formatter similar using an API similar to Swift DateFormatter to convert ISO8601 Duration strings into their `TimeInterval` equivalent in seconds, and back.
                   DESC
  spec.homepage     = "https://github.com/cyrilchandelier/ISO8601DurationFormatter"
  
  
  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.author             = { "Cyril Chandelier" => "cyril.chandelier@gmail.com" }
  spec.social_media_url   = "https://github.com/cyrilchandelier"
  
  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.platform     = :ios, "11.0"
  spec.swift_versions = "5.4"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source       = { :git => "https://github.com/cyrilchandelier/ISO8601DurationFormatter.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  spec.source_files  = "Sources/**/*.{swift}"
  spec.exclude_files = "Classes/Exclude"
end
