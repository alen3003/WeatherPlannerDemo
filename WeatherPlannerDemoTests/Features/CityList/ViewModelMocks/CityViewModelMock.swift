@testable import WeatherPlannerDemo

class CityViewModelMock {

    static var viewModel: CityViewModel {
        CityViewModel(city: CityMock.city(id: 0))
    }

}
