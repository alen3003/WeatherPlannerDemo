import Foundation

final class CityDetailsPresenter {
    
    var title: String?
    
    var cityViewModel: CityViewModel
    var airPollutionDetails: [AirPollutionDetailsViewModel] = []
    
    weak var delegate: Completable?
    private var cityDetailsUseCase: CityDetailsUseCase
    
    init(withDependencies dependencies: AppDependencies, cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        self.cityDetailsUseCase = dependencies.cityDetailsUseCase
        setControllerTitle()
    }
    
    private func setControllerTitle() {
        title = cityViewModel.cityName
    }
    
    func fetchPollutionInfo() {
        cityDetailsUseCase.getPollutionInfo(coordination: cityViewModel.coordination) { [weak self] (viewModels) in
            guard let self = self else { return }
            self.airPollutionDetails.append(contentsOf: viewModels)
            self.delegate?.didUpdateDataSource()
        }
    }
}
