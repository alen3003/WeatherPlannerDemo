import Foundation
import CoreLocation

class CityListRepository: CityListRepositoryProtocol {
    
    private let networkClient: ApiClientProtocol
    
    init(networkClient: ApiClientProtocol = NetworkModule().registerClient()) {
        self.networkClient = networkClient
    }
    
    internal func fetchCitiesInCircle(
        _ coordinate: CLLocationCoordinate2D,
        range: Int,
        resultHandler: @escaping (_ cities: CitiesInCircle) -> Void
    ) {
        let parameters = CitiesInCircleQueryParameters(
            latitude: "\(coordinate.latitude)",
            longitude: "\(coordinate.longitude)",
            radius: "\(range)",
            language: WeatherResponseLanguage.hr.rawValue
        ).propertyPairs()
        
        networkClient.get(path: ApiEndpoints.citiesInCircle.rawValue,
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
