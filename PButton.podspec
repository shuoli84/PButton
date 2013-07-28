Pod::Spec.new do |s|
  s.name         = "PButton"
  s.version      = "0.0.1"
  s.summary      = "Button which able to have different visual effects for different state, inner shadow, outer shadow, gradient etc." 
  s.homepage     = "https://github.com/shuoli84/PButton"
  s.license      = 'MIT (example)'

  s.author       = { "shuo li" => "shuoli84@gmail.com" }
  s.source       = { :git => "https://github.com/shuoli84/PButton.git" }
  s.platform     = :ios, '5.0'
  s.source_files = '*.{h,m}'
  s.requires_arc = true
end
