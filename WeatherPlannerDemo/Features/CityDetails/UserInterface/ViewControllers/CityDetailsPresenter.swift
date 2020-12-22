import Foundation

final class CityDetailsPresenter {
    
    var title: String?
    
    var cityViewModel: CityViewModel
    var airPollutionDetails: [AirPollutionDetailsViewModel] = []
    
    private var cityDetailsUseCase: CityDetailsUseCaseProtocol
    
    init(cityDetailsUseCase: CityDetailsUseCaseProtocol, cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        self.cityDetailsUseCase = cityDetailsUseCase
        setControllerTitle()
    }
    
    private func setControllerTitle() {
        title = cityViewModel.cityName
    }
    
    func fetchPollutionInfo() {
        cityDetailsUseCase.getPollutionInfo(
            coordination: cityViewModel.coordination,
            cityID: cityViewModel.cityID
        ) { [weak self] (airPollution) in
            guard let self = self else { return }
            let airPollutionDetailsViewModel = AirPollutionViewModel(airPollution: airPollution).airPollutionDetails()
            self.airPollutionDetails.append(contentsOf: airPollutionDetailsViewModel)
        }
    }
}
