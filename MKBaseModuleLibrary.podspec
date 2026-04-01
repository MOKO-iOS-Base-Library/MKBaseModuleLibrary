#
# Be sure to run `pod lib lint MKBaseModuleLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MKBaseModuleLibrary'
  s.version          = '2.2.0'
  s.summary          = 'Some basic component libraries of MOKO.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aadyx2007@163.com' => 'aadyx2007@163.com' }
  s.source           = { :git => 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  
  # 资源文件
  s.resource_bundles = {
      'MKBaseModuleLibrary' => ['MKBaseModuleLibrary/Assets/*']
  }
  
  # 公共头文件
  s.public_header_files = 'MKBaseModuleLibrary/Classes/**/*.h'
  
  # 依赖
  s.dependency 'Toast'
  s.dependency 'Masonry'
  s.dependency 'libxlsxwriter'
  s.dependency 'SSZipArchive'
  
  # 主 subspec
  s.subspec 'Defines' do |ss|
    ss.source_files = 'MKBaseModuleLibrary/Classes/Defines/*.h'
    ss.public_header_files = 'MKBaseModuleLibrary/Classes/Defines/*.h'
  end

  s.subspec 'Category' do |ss|
    ss.source_files = 'MKBaseModuleLibrary/Classes/Category/**/*.{h,m}'
    ss.dependency 'MKBaseModuleLibrary/Defines'
    ss.dependency 'Toast'
  end

  s.subspec 'Tools' do |ss|
    ss.subspec 'MKClassInfo' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKClassInfo/**/*.{h,m}'
    end
    ss.subspec 'MKDateFormatter' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKDateFormatter/**/*.{h,m}'
    end
    ss.subspec 'MKExcelManager' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKExcelManager/**/*.{h,m}'
      sss.dependency 'libxlsxwriter'
      sss.dependency 'SSZipArchive'
      sss.dependency 'MKBaseModuleLibrary/Defines'
    end
  end

  # 基础组件
  s.subspec 'Base' do |ss|
    # Cell
    ss.subspec 'Cell' do |sss|
      sss.subspec 'MKBaseCell' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/Cell/MKBaseCell/**/*.{h,m}'
        ssss.dependency 'MKBaseModuleLibrary/Defines'
      end
    end
    
    # View
    ss.subspec 'View' do |sss|
      sss.subspec 'CollectionView' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/View/CollectionView/**/*.{h,m}'
      end
      sss.subspec 'TableView' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/View/TableView/**/*.{h,m}'
      end
    end
    
    # Controller
    ss.subspec 'Controller' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/Controller/**/*.{h,m}'
      sss.dependency 'MKBaseModuleLibrary/Category'
      sss.dependency 'MKBaseModuleLibrary/Defines'
    end
    
    # NavigationController
    ss.subspec 'NavigationController' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/NavigationController/**/*.{h,m}'
    end
  end
  
  # 解决 xcodebuild 错误
  s.pod_target_xcconfig = {
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'DEFINES_MODULE' => 'YES',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
  
end
