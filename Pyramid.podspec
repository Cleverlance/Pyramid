Pod::Spec.new do |spec|
  spec.name             = 'Pyramid'
  spec.version          = '0.2.0'
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
  spec.dependency 'Result'

  spec.subspec 'AppVersion' do |subspec|
    subspec.source_files = 'Sources/App Version/**/*.swift'
  end

  spec.subspec 'ApplicationScope' do |subspec|
    subspec.source_files = 'Sources/Application Scope/**/*.swift'
  end

  spec.subspec 'Builder' do |subspec|
    subspec.source_files = 'Sources/Builder/**/*.swift'
  end

  spec.subspec 'CommandPattern' do |subspec|
    subspec.source_files = 'Sources/Command Pattern/**/*.swift'
  end

  spec.subspec 'Core' do |subspec|
    subspec.source_files = 'Sources/Core/**/*.swift'
  end

  spec.subspec 'Event' do |subspec|
    subspec.source_files = 'Sources/Event/**/*.swift'
  end

  spec.subspec 'Inactivity' do |subspec|
    subspec.source_files = 'Sources/Inactivity/**/*.swift'
  end

  spec.subspec 'LocalStorage' do |subspec|
    subspec.source_files = 'Sources/Local Storage/**/*.swift'
  end

  spec.subspec 'Localizer' do |subspec|
    subspec.source_files = 'Sources/Localizer/**/*.swift'
  end

  spec.subspec 'ScopeManagement' do |subspec|
    subspec.source_files = 'Sources/Scope Management/**/*.swift'
  end

  spec.subspec 'Timer' do |subspec|
    subspec.source_files = 'Sources/Timer/**/*.swift'
  end

  spec.subspec 'Testing' do |subspec|
    subspec.source_files = 'Sources/Testing/**/*.swift'
    subspec.dependency 'Pyramid/Core'
  end
end
