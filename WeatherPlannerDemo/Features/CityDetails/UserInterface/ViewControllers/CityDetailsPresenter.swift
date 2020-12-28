import RxSwift

final class CityDetailsPresenter {
    
    var title: String {
        return cityViewModel.cityName
    }
    
    var airPollutionDetails: Observable<[AirPollutionDetailsViewModel]>!
    
    var cityViewModel: CityViewModel
    private var cityDetailsUseCase: CityDetailsUseCaseProtocol
    
    init(cityDetailsUseCase: CityDetailsUseCaseProtocol, cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        self.cityDetailsUseCase = cityDetailsUseCase
        airPollutionDetails = fetchPollutionInfo()
    }
    
    
    private func fetchPollutionInfo() -> Observable<[AirPollutionDetailsViewModel]> {
        return cityDetailsUseCase.getPollutionInfo(
            coordination: cityViewModel.coordination,
            cityID: cityViewModel.cityID)
            .flatMap { airPollution -> Observable<[AirPollutionDetailsViewModel]> in
                guard let airPollution = airPollution else { return .just([]) }
                return Observable<[AirPollutionDetailsViewModel]>
                    .just(AirPollutionViewModel(airPollution: airPollution).airPollutionDetailsViewModel)
            }
    }
}
