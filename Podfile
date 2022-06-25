# Uncomment the next line to define a global platform for your project
platform :ios, '14.0'

flutter_application_path = '../gbkyc-module'
load File.join(flutter_application_path, '.ios', 'Flutter', 'podhelper.rb')

target 'sample-gbkyc-ios' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  install_all_flutter_pods(flutter_application_path)
end

post_install do |installer|
  flutter_post_install(installer) if defined?(flutter_post_install)

  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= [
         '$(inherited)',
          'PERMISSION_CAMERA=1',
          'PERMISSION_PHOTOS=1',
          'PERMISSION_MEDIA_LIBRARY=1'
        ]
    end
  end
end