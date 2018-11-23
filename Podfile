# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

inhibit_all_warnings!
target 'Natty' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Natty
  pod 'Kingfisher', '~> 4.0'
  pod 'SimulatorStatusMagic', :configurations => ['Debug']
  pod 'Texture'
  pod 'SwiftGen'
  pod 'SwiftyUserDefaults', '4.0.0-alpha.1'
  pod 'FPSCounter', '~> 3.0'
  pod 'LiquidTransition'
  
  target 'NattyTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NattyUITests' do
    inherit! :search_paths
    
    # Pods for testing
  end

  post_install do |installer_representation|
      installer_representation.pods_project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES'
          end
      end
   end
      
end
