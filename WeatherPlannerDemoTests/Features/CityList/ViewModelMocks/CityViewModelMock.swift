@testable import WeatherPlannerDemo

class CityViewModelMock {

    static var viewModel: CityViewModel {
        CityViewModel(city: CityMock.cityModel(id: 0))
    }

}
