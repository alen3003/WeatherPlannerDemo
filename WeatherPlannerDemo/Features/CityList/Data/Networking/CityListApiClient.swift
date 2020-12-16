import Foundation

final class CityListApiClient: BaseApiClient, CityListApiClientProtocol {
    
    func fetchCitiesInCircle(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (_ cities: CitiesInCircle) -> Void
    ) {
        let parameters = CitiesInCircleQueryParameters(
            latitude: "\(coordinate.lat)",
            longitude: "\(coordinate.lon)",
            radius: "\(range)",
            language: WeatherResponseLanguage.hr.rawValue
        ).propertyPairs()
        
        self.get(
            path: ApiEndpoints.citiesInCircle.rawValue,
            queryParameters: parameters,
            memberType: CitiesInCircle.self
        ) { (result) in
            switch result {
            case .success(let cities):
                resultHandler(cities)
            case .failure(let error):
                Logger.print(string: "Failed fetching data - \(error.localizedDescription)")
            }
        }
    }
    
}
