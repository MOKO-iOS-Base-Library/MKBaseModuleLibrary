#
# Be sure to run `pod lib lint MKBaseModuleLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MKBaseModuleLibrary'
  s.version          = '1.0.1'
  s.summary          = 'Some basic component libraries of MOKO.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aadyx2007@163.com' => 'aadyx2007@163.com' }
  s.source           = { :git => 'https://github.com/MOKO-iOS-Base-Library/MKBaseModuleLibrary.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '11.0'

#  s.source_files = 'MKBaseModuleLibrary/Classes/**/*'
  
  # s.resource_bundles = {
  #   'MKBaseModuleLibrary' => ['MKBaseModuleLibrary/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  
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
  end

  s.subspec 'Tools' do |ss|
    ss.subspec 'MKAttributedString' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKAttributedString/**'
    end
    ss.subspec 'MKDateFormatter' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKDateFormatter/**'
    end
    ss.subspec 'MKModuleManager' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Tools/MKModuleManager/**'
    end
  end

  s.subspec 'CustomUI' do |ss|
    ss.subspec 'HaveRefreshView' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/HaveRefreshView/**'
      sss.dependency 'MJRefresh'
    end
    ss.subspec 'MKHexKeyBoard' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/MKHexKeyBoard/**'
      sss.dependency 'MKBaseModuleLibrary/Category'
      sss.dependency 'MKBaseModuleLibrary/Defines'
    end
    ss.subspec 'MKHudManager' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/MKHudManager/**'
      sss.dependency 'MBProgressHUD'
      sss.dependency 'MKBaseModuleLibrary/Defines'
    end
    ss.subspec 'MKPageControl' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/MKPageControl/**'
    end
    ss.subspec 'MKProgressView' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/MKProgressView/**'
      sss.dependency 'Masonry'
      sss.dependency 'CircleProgressBar'
      sss.dependency 'MKBaseModuleLibrary/Category'
      sss.dependency 'MKBaseModuleLibrary/Defines'
    end
    ss.subspec 'XDRefresh' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/XDRefresh/**'
    end
    ss.subspec 'MKPickerView' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/MKPickerView/**'
      sss.dependency 'MKBaseModuleLibrary/Defines'
      sss.dependency 'MKBaseModuleLibrary/Tools/MKAttributedString'
    end
    ss.subspec 'MKSlider' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/CustomUI/MKSlider/**'
      sss.dependency 'MKBaseModuleLibrary/Defines'
    end
  end

  s.subspec 'Base' do |ss|
    ss.subspec 'Cell' do |sss|
      sss.subspec 'MKBaseCell' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/Cell/MKBaseCell/**'
        ssss.dependency 'Masonry'
        ssss.dependency 'MKBaseModuleLibrary/Defines'
      end
      sss.subspec 'MKNormalTextCell' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/Cell/MKNormalTextCell/**'
        ssss.dependency 'Masonry'
        ssss.dependency 'MKBaseModuleLibrary/Defines'
        ssss.dependency 'MKBaseModuleLibrary/Base/Cell/MKBaseCell'
      end
      sss.subspec 'MKTextButtonCell' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/Cell/MKTextButtonCell/**'
        ssss.dependency 'Masonry'
        ssss.dependency 'MKBaseModuleLibrary/Defines'
        ssss.dependency 'MKBaseModuleLibrary/Base/Cell/MKBaseCell'
        ssss.dependency 'MKBaseModuleLibrary/CustomUI/MKPickerView'
      end
      sss.subspec 'MKTextFieldCell' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/Cell/MKTextFieldCell/**'
        ssss.dependency 'Masonry'
        ssss.dependency 'MKBaseModuleLibrary/Defines'
        ssss.dependency 'MKBaseModuleLibrary/Base/Cell/MKBaseCell'
        ssss.dependency 'MKBaseModuleLibrary/Category'
      end
    end
    ss.subspec 'View' do |sss|
      sss.subspec 'CollectionView' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/View/CollectionView/**'
      end
      sss.subspec 'TableView' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/View/TableView/**'
      end
      sss.subspec 'WRNavigationBar' do |ssss|
        ssss.source_files = 'MKBaseModuleLibrary/Classes/Base/View/WRNavigationBar/**'
        ssss.dependency 'MKBaseModuleLibrary/Defines'
      end
    end
    ss.subspec 'Controller' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/Controller/**'
#        sss.dependency 'YYKit'
      sss.dependency 'MKBaseModuleLibrary/Category'
      sss.dependency 'MKBaseModuleLibrary/Defines'
      sss.dependency 'MKBaseModuleLibrary/Base/View/WRNavigationBar'
    end
    ss.subspec 'NavigationController' do |sss|
      sss.source_files = 'MKBaseModuleLibrary/Classes/Base/NavigationController/**'
    end
  end
  
end
