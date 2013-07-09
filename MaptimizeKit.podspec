Pod::Spec.new do |s|
  s.name         = "MaptimizeKit"
  s.version      = "1.0.0"
  s.summary      = "MaptimizeKit is a Cocoa Touch static library that help to display Maptimize markers and clusters on a MKMapView."
  s.homepage     = "https://github.com/eet-nu/MaptimizeKit"

  s.license      = "Unknown"
  s.author       = { "Oleg Shnitko" => "olegshnitko@gmail.com" }
  
  s.source       = { :git => "https://github.com/eet-nu/MaptimizeKit.git", :tag => "1.0.0" }
  s.platform     = :ios, '6.0'

  s.source_files = 'Classes', 'Classes/**/*.{h,m}', 'GTMNSString+URLArguments.{h,m}', 'TouchCustoms/Classes', 'TouchCustoms/Classes/**/*.{h,m}'
  s.exclude_files = 'Classes/Exclude'

  s.public_header_files = 'Classes/**/*.h GTMNSString+URLArguments.h TouchCustoms/Classes/**/*.h'

  s.requires_arc = false

  s.dependency 'AFNetworking', '~> 1.2.1'
end
