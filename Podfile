platform :ios, '11.0'

use_frameworks!
inhibit_all_warnings!

def test_pods()
  pod 'Quick'
  pod 'Nimble'
end

target 'MyApp' do
  pod 'SnapKit'

  target 'MyAppTests' do
    inherit! :search_paths
    test_pods
  end

end

target 'MyServices' do
  target 'MyServicesTests' do
    inherit! :search_paths
    test_pods
  end

end

target 'MyUtils' do
  target 'MyUtilsTests' do
    inherit! :search_paths
    test_pods
  end
end
