import RxSwift

final class CityDetailsApiClient: BaseApiClient, CityDetailsApiClientProtocol {

    func fetchPollutionInfo(coordination: City.Coordination) -> Observable<AirPollutionWrapper> {
        get(path: ApiEndpoints.airPollution.rawValue, queryParameters: parameters(for: coordination).propertyPairs())
    }

    private func parameters(for coordinate: City.Coordination) -> AirPollutionQueryParameters {
        AirPollutionQueryParameters(latitude: "\(coordinate.lat)", longitude: "\(coordinate.lon)")
    }

}
