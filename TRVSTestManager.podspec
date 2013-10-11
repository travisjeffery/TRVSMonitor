Pod::Spec.new do |s|
  s.name         = "TRVSTestManager"
  s.version      = "0.0.1"
  s.summary      = "A short description of TRVSTestManager."
  s.homepage     = "http://EXAMPLE/TRVSTestManager"
  s.license      = 'MIT'
  s.author       = { "Travis Jeffery" => "tj@travisjeffery.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "http://EXAMPLE/TRVSTestManager.git", :tag => "0.0.1" }
  s.source_files  = 'TRVSTestManager', 'TRVSTestManager/**/*.{h,m}'
  s.requires_arc = true
end
