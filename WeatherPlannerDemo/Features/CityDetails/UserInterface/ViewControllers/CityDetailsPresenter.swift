import Resolver
import RxSwift

final class CityDetailsPresenter {
    
    @Injected(container: .custom) private var cityDetailsUseCase: CityDetailsUseCaseProtocol
    var cityViewModel: CityViewModel
    
    var title: String? {
        return cityViewModel.cityName
    }
    
    var airPollutionDetails: Observable<[AirPollutionDetailsViewModel]>!
    
    init(cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        airPollutionDetails = fetchPollutionInfo()
    }
    
    private func fetchPollutionInfo() -> Observable<[AirPollutionDetailsViewModel]> {
        
        //guard let viewModel = cityViewModel else { return .just([]) }
        
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
