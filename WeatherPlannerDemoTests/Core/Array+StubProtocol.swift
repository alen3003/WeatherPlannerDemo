@testable import WeatherPlannerDemo

extension Array where Element: StubProtocol {

    static func stub(withCount count: Int) -> Array {
        (1...count).map {
            .stub(withId: $0)
        }
    }

}

extension CityModel: StubProtocol {

    static func stub(withId id: Int) -> CityModel {
        CityMock.cityModel(id: id)
    }

}
