import Foundation
import CoreLocation

final class CityListViewModelList {
    
    var title: String?
    var cities: [CityViewModel] = []
    var coordinate: CLLocationCoordinate2D?
    
    private let networkClient: ApiClientProtocol
    weak var delegate: Completable?
    
    init(networkClient: ApiClientProtocol = NetworkModule().registerClient()) {
        self.networkClient = networkClient
        setControllerTitle()
    }
    
    private func setControllerTitle() {
        title = LocalizationKey.helloMessage.string
    }
    
    private func fetchCitiesInCircle() {
        
        guard let coordinate = coordinate else { return }
       
        let parameters = CitiesInCircleParameters(
            latitude: "\(coordinate.latitude)",
            longitude: "\(coordinate.longitude)",
            radius: "\(10)",
            language: WeatherResponseLanguage.hr.rawValue
        ).propertyPairs()
        
        networkClient.get(path: ApiEndpoints.citiesInCircle.rawValue,
                          queryParameters: parameters,
                          memberType: CitiesInCircle.self
        ) { [weak self] (result) in
            switch result {
            case .success(let cities):
                cities.list.forEach({ self?.cities.append(CityViewModel(city: $0)) })
                self?.delegate?.didUpdateDataSource()
            case .failure(let error):
                Logger.print(string: "Failed fetching data - \(error.localizedDescription)")
            }
        }
    }
    
    func setLocation(coordinate: CLLocationCoordinate2D) {
        if self.coordinate == nil {
            self.coordinate = coordinate
            fetchCitiesInCircle()
        }
    }
}
