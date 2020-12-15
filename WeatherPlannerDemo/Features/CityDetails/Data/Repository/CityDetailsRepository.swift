import Foundation

class CityDetailsRepository: CityDetailsRepositoryProtocol {

    private let networkClient: ApiClientProtocol
    
    init(networkClient: ApiClientProtocol = NetworkModule().registerClient()) {
        self.networkClient = networkClient
    }

    func fetchPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: [AirPollutionDetailsViewModel]) -> Void
    ) {
        let parameters = AirPollutionQueryParameters(
            latitude: "\(coordination.lat)",
            longitude: "\(coordination.lon)"
        ).propertyPairs()
        
        networkClient.get(path: ApiEndpoints.airPollution.rawValue,
                          queryParameters: parameters,
                          memberType: AirPollutionWrapper.self
        ) { (result) in
            switch result {
            case .success(let airPollutionList):
                guard let airPollution = airPollutionList.list.first else { return }
                let airPollutionViewModel = AirPollutionViewModel(airPollution: airPollution)
                resultHandler(airPollutionViewModel.airPollutionDetailsViewModel)
            case .failure(let error):
                Logger.print(string: "Failed fetching data - \(error.localizedDescription)")
            }
        }
    }

}
