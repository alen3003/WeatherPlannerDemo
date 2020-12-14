import Foundation
import CoreLocation

final class CityListPresenter {
    
    var title: String?
    var cities: [CityViewModel] = []
    weak var delegate: Completable?
    
    private var citiesInRange = 30
    private var coordinate: CLLocationCoordinate2D?
    private let networkClient: ApiClientProtocol
    
    init(networkClient: ApiClientProtocol = NetworkModule().registerClient()) {
        self.networkClient = networkClient
        setControllerTitle()
    }
    
    private func setControllerTitle() {
        title = LocalizationKey.helloMessage.string
    }
    
    private func fetchCitiesInCircle() {
        
        guard let coordinate = coordinate else { return }
       
        let parameters = CitiesInCircleQueryParameters(
            latitude: "\(coordinate.latitude)",
            longitude: "\(coordinate.longitude)",
            radius: "\(citiesInRange)",
            language: WeatherResponseLanguage.hr.rawValue
        ).propertyPairs()
        
        networkClient.get(path: ApiEndpoints.citiesInCircle.rawValue,
                          queryParameters: parameters,
                          memberType: CitiesInCircle.self
        ) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let cities):
                cities.list.forEach({ self.cities.append(CityViewModel(city: $0)) })
                self.delegate?.didUpdateDataSource()
            case .failure(let error):
                Logger.print(string: "Failed fetching data - \(error.localizedDescription)")
            }
        }
    }
    
    func setLocation(coordinate: CLLocationCoordinate2D) {
        guard self.coordinate == nil else { return }
        self.coordinate = coordinate
        fetchCitiesInCircle()
    }
}
