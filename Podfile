# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Pokemon' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

   pod 'AlamofireMapper'
   pod 'Alamofire'
   pod 'ProgressHUD'
   pod 'Firebase/Core'
   pod 'Firebase/Database'
   pod 'Firebase/Crashlytics'
   pod 'Firebase/Analytics'
   pod 'Firebase/RemoteConfig'
   
   target 'PokemonTests' do
           inherit! :search_paths
           pod 'Firebase'
       end
  
   post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
