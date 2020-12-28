import RxSwift

final class CityListApiClient: BaseApiClient, CityListApiClientProtocol {
    
    func fetchCitiesInCircle( _ coordinate: City.Coordination, range: Int) -> Observable<CitiesInCircle> {
        
        let parameters = CitiesInCircleQueryParameters(
            latitude: "\(coordinate.lat)",
            longitude: "\(coordinate.lon)",
            radius: "\(range)",
            language: WeatherResponseLanguage.hr.rawValue
        ).propertyPairs()
        
        return get(
            path: ApiEndpoints.citiesInCircle.rawValue,
            queryParameters: parameters)
    }
    
}
