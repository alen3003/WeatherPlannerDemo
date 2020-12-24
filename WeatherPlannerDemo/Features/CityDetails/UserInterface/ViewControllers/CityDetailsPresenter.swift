import RxSwift

final class CityDetailsPresenter {
    
    var title: String {
        return cityViewModel.cityName
    }
    
    var airPollutionDetails: Observable<[AirPollutionDetailsViewModel]> {
        return fetchPollutionInfo()
    }
    
    var cityViewModel: CityViewModel
    private var cityDetailsUseCase: CityDetailsUseCaseProtocol
    
    init(cityDetailsUseCase: CityDetailsUseCaseProtocol, cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        self.cityDetailsUseCase = cityDetailsUseCase
    }
    
    
    private func fetchPollutionInfo() -> Observable<[AirPollutionDetailsViewModel]> {
        return cityDetailsUseCase.getPollutionInfo(
            coordination: cityViewModel.coordination,
            cityID: cityViewModel.cityID)
            .map { airPollutionWrapper in
                guard let airPollution = airPollutionWrapper.list.first else { return [] }
                return AirPollutionViewModel(airPollution: airPollution).airPollutionDetailsViewModel
            }
    }
}
