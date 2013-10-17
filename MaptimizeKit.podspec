Pod::Spec.new do |s|
  s.name         = "MaptimizeKit"
  s.version      = "1.0.0"
  s.summary      = "MaptimizeKit is a Cocoa Touch static library that help to display Maptimize markers and clusters on a MKMapView."
  s.homepage     = "https://github.com/eet-nu/MaptimizeKit"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Oleg Shnitko" => "olegshnitko@gmail.com" }
  
  s.source       = { :git => "https://github.com/eet-nu/MaptimizeKit.git", :tag => "1.0.0" }
  s.platform     = :ios, '6.0'

  s.source_files = 'Classes', 'Classes/**/*.{h,m}', 'GTMNSString+URLArguments.{h,m}', 'GTMGarbageCollection.h', 'GTMDefines.h'

  s.requires_arc = false

  s.dependency 'AFNetworking', '~> 2.0.1'
end
