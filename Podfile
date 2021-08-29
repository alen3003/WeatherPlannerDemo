platform :ios, '13.0'
workspace 'WeatherPlannerDemo.xcworkspace'
source 'https://github.com/CocoaPods/Specs.git'

def shared_pods
  pod 'PureLayout'
  pod 'SwiftLint'
  pod 'ReachabilitySwift'
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'RxDataSources'
  pod 'Resolver'
  pod 'Nimble'
  pod 'RxTest'
  pod 'RxBlocking'
  pod 'Sourcery'
end

target 'WeatherPlannerDemo' do
  use_frameworks!
  shared_pods
end

target 'WeatherPlannerDemoTests' do
  use_frameworks!
  shared_pods
end

target 'WeatherPlannerDemoUITests' do
  use_frameworks!
  shared_pods
end
