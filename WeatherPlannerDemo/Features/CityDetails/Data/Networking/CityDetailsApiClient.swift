import RxSwift

final class CityDetailsApiClient: BaseApiClient, CityDetailsApiClientProtocol {

    func fetchPollutionInfo(coordination: City.Coordination) -> Observable<AirPollutionWrapper> {
        let parameters = AirPollutionQueryParameters(
            latitude: "\(coordination.lat)",
            longitude: "\(coordination.lon)"
        ).propertyPairs()
        
        return get(path: ApiEndpoints.airPollution.rawValue, queryParameters: parameters)
    }

}
