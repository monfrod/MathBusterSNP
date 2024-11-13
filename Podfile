# Uncomment the next line to define a global platform for your project
 platform :ios, '18.0'

use_frameworks!
use_modular_headers!

target 'MathBusterSNP' do
  # Comment the next line if you don't want to use dynamic frameworks
  #use_frameworks!

  # Pods for MathBusterSNP
pod 'SnapKit', '~> 5.7.0'
pod 'Firebase/Auth'
pod 'Firebase/Firestore'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name == 'abseil'
      Pod::UI.puts "Workaround: Configuring abseil to use gnu++14 language standard for cocoapods 1.16+ compatibility".yellow
      Pod::UI.puts "            Remove workaround when upstream issue fixed https://github.com/firebase/firebase-ios-sdk/issues/13996".yellow
      target.build_configurations.each do |config|
        config.build_settings['CLANG_CXX_LANGUAGE_STANDARD'] = 'gnu++14'
      end
    end
  end
end