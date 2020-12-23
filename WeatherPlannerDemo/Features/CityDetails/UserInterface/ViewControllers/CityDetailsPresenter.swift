import RxSwift

final class CityDetailsPresenter {
    
    var title: String?
    
    var cityViewModel: CityViewModel
    var airPollutionDetails: Observable<[AirPollutionDetailsViewModel]> = .just([])
    
    private var cityDetailsUseCase: CityDetailsUseCaseProtocol
    
    init(cityDetailsUseCase: CityDetailsUseCaseProtocol, cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        self.cityDetailsUseCase = cityDetailsUseCase
        setControllerTitle()
        airPollutionDetails = fetchPollutionInfo()
    }
    
    private func setControllerTitle() {
        title = cityViewModel.cityName
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
