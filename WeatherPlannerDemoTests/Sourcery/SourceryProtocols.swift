@testable import WeatherPlannerDemo

// sourcery: AutoMockable
extension CoordinatorProtocol {}
// sourcery: AutoMockable
extension CityListUseCaseProtocol {}
// sourcery: AutoMockable
extension CityDetailsUseCaseProtocol {}

extension CityModel: StubProtocol {

    static func stub(withId id: Int) -> CityModel {
        CityMock.cityModel(id: id)
    }

}
