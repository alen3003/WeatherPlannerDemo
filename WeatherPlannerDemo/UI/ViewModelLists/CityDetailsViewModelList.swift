import Foundation

final class CityDetailsViewModelList {
    
    var title: String?
    var cityViewModel: CityViewModel
    var airPollutionViewModel: AirPollutionViewModel?
    weak var delegate: Completable?
    
    private let networkClient: ApiClientProtocol
    
    init(networkClient: ApiClientProtocol = NetworkModule().registerClient(), cityViewModel: CityViewModel) {
        self.cityViewModel = cityViewModel
        self.networkClient = networkClient
        setControllerTitle()
    }
    
    private func setControllerTitle() {
        title = cityViewModel.cityName
    }
    
    func fetchPollutionInfo() {
        
        let parameters = AirPollutionQueryParameters(
            latitude: "\(cityViewModel.city.coord.lat)",
            longitude: "\(cityViewModel.city.coord.lon)"
        ).propertyPairs()
        
        networkClient.get(path: ApiEndpoints.airPollution.rawValue,
                          queryParameters: parameters,
                          memberType: AirPollutionWrapper.self
        ) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let airPollutionList):
                guard let airPollution = airPollutionList.list.first else { return }
                self.airPollutionViewModel = AirPollutionViewModel(airPollution: airPollution)
                self.delegate?.didUpdateDataSource()
            case .failure(let error):
                Logger.print(string: "Failed fetching data - \(error.localizedDescription)")
            }
        }
    }
}
