import Foundation

final class CityDetailsApiClient: BaseApiClient, CityDetailsApiClientProtocol {
    func fetchPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping ([AirPollutionDetailsViewModel]) -> Void) {
        let parameters = AirPollutionQueryParameters(
            latitude: "\(coordination.lat)",
            longitude: "\(coordination.lon)"
        ).propertyPairs()
        
        self.get(path: ApiEndpoints.airPollution.rawValue,
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
