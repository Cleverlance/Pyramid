Pod::Spec.new do |spec|
  spec.name             = 'Pyramid'
  spec.version          = '0.1.0'
  spec.summary          = 'Basic concepts for iOS app architecture'
  spec.description      = <<-DESC
Basic concepts for iOS app architecture.
                       DESC

  spec.homepage         = 'https://github.com/cleverlance/Pyramid'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'jakubvano' => 'jakub.vano@cleverlance.com' }
  spec.source           = { :git => 'https://github.com/cleverlance/Pyramid.git', :tag => spec.version.to_s }

  spec.ios.deployment_target = '8.0'

  spec.dependency 'Swinject', '~> 2.0'
  spec.dependency 'SwinjectAutoregistration'
  spec.dependency 'ObjectMapper', '~> 2.0'

  spec.default_subspec = 'Core'

  spec.subspec 'Core' do |core|
    core.source_files = 'Sources/Core/**/*'
  end

  spec.subspec 'Testing' do |testing|
    testing.source_files = 'Sources/Testing/**/*'
  end
end
