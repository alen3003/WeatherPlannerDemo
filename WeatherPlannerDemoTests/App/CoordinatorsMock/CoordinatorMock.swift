@testable import WeatherPlannerDemo

class CoordinatorMock: CoordinatorProtocol {
    func pushCityDetailsViewController(viewModel: CityViewModel) {}
}
