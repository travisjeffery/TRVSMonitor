Pod::Spec.new do |s|
  s.name         = "TRVSMonitor"
  s.version      = "0.0.1"
  s.summary      = "A sync construct with the ability to wait until signalled that a condition has been met."
  s.homepage     = "http://github.com/travisjeffery/TRVSMonitor"
  s.license      = 'MIT'
  s.author       = { "Travis Jeffery" => "tj@travisjeffery.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "http://github.com/travisjeffery/TRVSMonitor.git", :tag => "0.0.1" }
  s.source_files  = 'TRVSMonitor', 'TRVSMonitor/**/*.{h,m}'
  s.requires_arc = true
end
