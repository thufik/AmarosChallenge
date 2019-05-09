use_frameworks!

target 'Amaro-challenge' do
	pod 'Alamofire'
	pod 'AlamofireImage'
	pod 'INSPhotoGallery'
	pod 'Hero'
	pod 'BottomPopup'
	pod 'BBBadgeBarButtonItem'
	pod 'DZNEmptyDataSet'
  pod 'SwiftEntryKit', '0.7.2'
  pod 'MKToolTip'
end

target 'Amaro-challengeTests' do
  pod 'Alamofire'
  pod 'AlamofireImage'
  pod 'INSPhotoGallery'
  pod 'Hero'
  pod 'BottomPopup'
  pod 'BBBadgeBarButtonItem'
  pod 'DZNEmptyDataSet'
  pod 'SwiftEntryKit', '0.7.2'
  pod 'MKToolTip'
end

target 'Amaro-challengeUITests' do
  pod 'Swifter', '1.3.2'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'QuickLayout'
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4'
      end
    end
    if target.name == 'SwiftEntryKit'
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '4'
      end
    end
    if target.name == 'Swifter'
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.2'
      end
    end
  end
end
