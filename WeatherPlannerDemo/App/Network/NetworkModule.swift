import Foundation

public class NetworkModule {

    func registerCityListApiClient() -> CityListApiClientProtocol {
        return CityListApiClient(baseUrl: ApiEndpoints.base.rawValue)
    }

    func registerCityDetailsApiClient() -> CityDetailsApiClientProtocol {
        return CityDetailsApiClient(baseUrl: ApiEndpoints.base.rawValue)
    }
}
