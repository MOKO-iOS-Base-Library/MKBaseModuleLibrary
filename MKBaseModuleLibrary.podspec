#
# Be sure to run `pod lib lint MKBaseModuleLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MKBaseModuleLibrary'
  s.version          = '2.2.5'
  s.summary          = 'Some basic component libraries of MOKO.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aadyx2007@163.com' => 'aadyx2007@163.com' }
  s.source           = { :git => 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary.git', :tag => s.version.to_s }

  s.ios.deployment_target = '14.0'
  
  s.resource_bundles = {
      'MKBaseModuleLibrary' => ['MKBaseModuleLibrary/Assets/*']
  }
  
  s.dependency 'Masonry', '~> 1.1'
  s.dependency 'Toast', '~> 4.1'
  s.dependency 'WRNavigationBar', '~> 1.4'
  
  
  s.subspec 'Defines' do |ss|
    ss.source_files = 'MKBaseModuleLibrary/Classes/Defines/*.h'
  end

  s.subspec 'Category' do |ss|
    ss.source_files = 'MKBaseModuleLibrary/Classes/Category/**'
    
    ss.dependency 'MKBaseModuleLibrary/Defines'
    ss.dependency 'MKBaseModuleLibrary/Tools/MKClassInfo'
  end

  s.subspec 'Tools' do |ss|
    ss.dependency 'MKBaseModuleLibrary/Defines'
    ss.subspec 'MKClassInfo' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKClassInfo/**'
    end
    ss.subspec 'MKExcelManager' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKExcelManager/**'
      
      sss.dependency 'libxlsxwriter', '~> 1.1.7'
      sss.dependency 'SSZipArchive', '~> 2.4.0'
      
    end
  end

  s.subspec 'Base' do |ss|
    ss.dependency 'MKBaseModuleLibrary/Defines'
    ss.dependency 'MKBaseModuleLibrary/Category'
    
    ss.subspec 'MKBaseCell' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/MKBaseCell/**'
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
    end
    ss.subspec 'NavigationController' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/NavigationController/**'
    end
  end
  
end
