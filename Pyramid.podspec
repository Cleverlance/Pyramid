Pod::Spec.new do |s|
  s.name             = 'Pyramid'
  s.version          = '0.1.0'
  s.summary          = 'Basic concepts for iOS app architecture'
  s.description      = <<-DESC
Basic concepts for iOS app architecture.
                       DESC

  s.homepage         = 'https://github.com/cleverlance/Pyramid'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jakubvano' => 'jakub.vano@cleverlance.com' }
  s.source           = { :git => 'https://github.com/cleverlance/Pyramid.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/**/*'

  s.dependency 'Swinject', '~> 2.0'
  s.dependency 'SwinjectAutoregistration'
  s.dependency 'ObjectMapper', '~> 2.0'
end
