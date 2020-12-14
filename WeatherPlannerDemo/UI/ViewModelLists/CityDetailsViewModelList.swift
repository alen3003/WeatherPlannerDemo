import Foundation

final class CityDetailsViewModelList {
    
    var title: String?
    var cityViewModel: CityViewModel
    var airPollutionDetails: [AirPollutionDetailsViewModel] = []
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
            latitude: "\(cityViewModel.coordination.lat)",
            longitude: "\(cityViewModel.coordination.lon)"
        ).propertyPairs()
        
        networkClient.get(path: ApiEndpoints.airPollution.rawValue,
                          queryParameters: parameters,
                          memberType: AirPollutionWrapper.self
        ) { [weak self] (result) in
            switch result {
            case .success(let airPollutionList):
                guard
                    let self = self,
                    let airPollution = airPollutionList.list.first
                else {
                    return
                }
                let airPollutionViewModel = AirPollutionViewModel(airPollution: airPollution)
                self.airPollutionDetails = airPollutionViewModel.airPollutionDetailsViewModel
                self.delegate?.didUpdateDataSource()
            case .failure(let error):
                Logger.print(string: "Failed fetching data - \(error.localizedDescription)")
            }
        }
    }
}
