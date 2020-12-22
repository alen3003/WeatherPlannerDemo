import Foundation

final class CityDetailsApiClient: BaseApiClient, CityDetailsApiClientProtocol {
    
    func fetchPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (AirPollution) -> Void) {
        let parameters = AirPollutionQueryParameters(
            latitude: "\(coordination.lat)",
            longitude: "\(coordination.lon)"
        ).propertyPairs()
        
        self.get(path: ApiEndpoints.airPollution.rawValue,
                          queryParameters: parameters,
                          memberType: AirPollutionWrapper.self
        )
    }
    
}
