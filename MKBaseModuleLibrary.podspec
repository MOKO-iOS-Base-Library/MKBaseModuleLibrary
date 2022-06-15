#
# Be sure to run `pod lib lint MKBaseModuleLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MKBaseModuleLibrary'
  s.version          = '1.1.5'
  s.summary          = 'Some basic component libraries of MOKO.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aadyx2007@163.com' => 'aadyx2007@163.com' }
  s.source           = { :git => 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  
  s.source_files = 'MKBaseModuleLibrary/Classes/MKBaseModule.h'
  s.resource_bundles = {
      'MKBaseModuleLibrary' => ['MKBaseModuleLibrary/Assets/*']
  }
  s.subspec 'Defines' do |ss|
    ss.source_files = 'MKBaseModuleLibrary/Classes/Defines/*.h'
  end

  s.subspec 'Category' do |ss|
    ss.source_files = 'MKBaseModuleLibrary/Classes/Category/**'
    ss.dependency 'Toast'
    ss.dependency 'MKBaseModuleLibrary/Defines'
    ss.dependency 'MKBaseModuleLibrary/Tools/MKClassInfo'
  end

  s.subspec 'Tools' do |ss|
    ss.subspec 'MKDateFormatter' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKDateFormatter/**'
    end
    ss.subspec 'MKModuleManager' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKModuleManager/**'
    end
    ss.subspec 'MKClassInfo' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKClassInfo/**'
    end
  end

  s.subspec 'Base' do |ss|
    ss.subspec 'Cell' do |sss|
      sss.subspec 'MKBaseCell' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/Cell/MKBaseCell/**'
        ssss.dependency 'Masonry'
        ssss.dependency 'MKBaseModuleLibrary/Defines'
      end
    end
    ss.subspec 'View' do |sss|
      sss.subspec 'CollectionView' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/View/CollectionView/**'
      end
      sss.subspec 'TableView' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/View/TableView/**'
      end
    end
    ss.subspec 'Controller' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/Controller/**'
      sss.dependency 'MKBaseModuleLibrary/Category'
      sss.dependency 'MKBaseModuleLibrary/Defines'
      
      sss.dependency 'WRNavigationBar'
    end
    ss.subspec 'NavigationController' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/NavigationController/**'
    end
  end
  
end
