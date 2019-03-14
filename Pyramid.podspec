Pod::Spec.new do |spec|
  spec.name             = 'Pyramid'
  spec.version          = '0.8.1'
  spec.summary          = 'Basic concepts for iOS app architecture'
  spec.description      = <<-DESC
Basic concepts for iOS app architecture.
                       DESC

  spec.homepage         = 'https://github.com/cleverlance/Pyramid'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'jakubvano' => 'jakub.vano@cleverlance.com' }
  spec.source           = { :git => 'https://github.com/cleverlance/Pyramid.git', :tag => spec.version.to_s }
  spec.swift_version    = '4.2'

  spec.ios.deployment_target      = '8.0'
  spec.watchos.deployment_target  = '2.0'

  spec.source_files     = 'Sources/Common/**/*.{swift,h,m}'
  spec.ios.source_files = 'Sources/iOS/**/*.{swift,h,m}'

  spec.dependency 'Swinject'
  spec.dependency 'SwinjectAutoregistration'
  spec.dependency 'KeychainAccess'
  spec.dependency 'Result'
end
