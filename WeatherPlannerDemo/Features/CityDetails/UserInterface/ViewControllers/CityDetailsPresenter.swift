import Resolver
import RxSwift

final class CityDetailsPresenter {
    
    @Injected(container: .custom) private var cityDetailsUseCase: CityDetailsUseCaseProtocol

    var cityViewModel: CityViewModel!

    var title: String? {
        cityViewModel?.cityName
    }

    var airPollutionDetails: Observable<[AirPollutionDetailsViewModel]>!

    init(cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        airPollutionDetails = fetchPollutionInfo()
    }

    func fetchPollutionInfo() -> Observable<[AirPollutionDetailsViewModel]> {
        guard let viewModel = cityViewModel else { return .just([]) }
        
        return cityDetailsUseCase.getPollutionInfo(
            latitude: viewModel.latitude,
            longitude: viewModel.longitude,
            cityID: viewModel.cityID)
            .flatMap { airPollution -> Observable<[AirPollutionDetailsViewModel]> in
                guard let airPollution = airPollution else { return .just([]) }

                return Observable<[AirPollutionDetailsViewModel]>
                    .just(AirPollutionViewModel(airPollution: airPollution).airPollutionDetails)
            }
    }

}
