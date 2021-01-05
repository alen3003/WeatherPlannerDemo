@testable import WeatherPlannerDemo

// sourcery: AutoMockable
extension CoordinatorProtocol {}
// sourcery: AutoMockable
extension CityListUseCaseProtocol {}
// sourcery: AutoMockable
extension CityDetailsUseCaseProtocol {}

extension City: StubProtocol {
    static func stub(withId id: Int) -> City {
        return CityMock.city(id: id)
    }
}
