@testable import WeatherPlannerDemo

class CityViewModelMock {
    static var viewModel: CityViewModel {
        return CityViewModel(city: CityMock.city(id: 0))
    }
}
