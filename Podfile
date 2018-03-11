# Uncomment this line to define a global platform for your project
platform :ios, '9.0'
# Uncomment this line if you're using Swift
use_frameworks!

# # Developer Helpers
pod 'SwifterSwift'
pod 'SnapKit', '~> 4.0.0'

# # Logic

# # DB & Networking
pod 'Moya-ObjectMapper'
pod 'Moya'
pod 'ObjectMapper'
pod 'SwiftSpinner'
pod 'IQKeyboardManagerSwift', '5.0.0'

post_install do |installer|
	swift40Targets = ['SwifterSwift']
	
	installer.pods_project.targets.each do |target|
		if swift40Targets.include? target.name
			target.build_configurations.each do |config|
				config.build_settings['SWIFT_VERSION'] = '4.0'
			end
		end
	end
end

target 'Tumblr' do

end

