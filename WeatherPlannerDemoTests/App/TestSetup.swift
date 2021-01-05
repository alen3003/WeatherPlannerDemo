import Resolver

@testable import WeatherPlannerDemo

class TestSetup: NSObject {

    override init() {
        AppDependeciesTest.shared.registerDependencies(in: Resolver.custom)
    }
}
