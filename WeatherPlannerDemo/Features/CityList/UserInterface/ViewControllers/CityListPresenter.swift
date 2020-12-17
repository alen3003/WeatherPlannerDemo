import Foundation
import CoreLocation

final class CityListPresenter {
    
    var title: String?
    var cities: [CityViewModel] = []
    
    weak var delegate: Completable?
    private var cityListUseCase: CityListUseCaseProtocol
    weak var coordinator: CoordinatorProtocol?
    
    private var citiesInRange = 5
    private var coordinate: CLLocationCoordinate2D?
    
    init(cityListUseCase: CityListUseCaseProtocol, coordinator: CoordinatorProtocol) {
        self.cityListUseCase = cityListUseCase
        self.coordinator = coordinator
        setControllerTitle()
    }
    
    private func setControllerTitle() {
        title = LocalizationKey.helloMessage.string
    }
    
    func setLocation(coordinate: CLLocationCoordinate2D) {
        guard self.coordinate == nil else { return }
        self.coordinate = coordinate
        fetchWeather()
    }
    
    func pushCityDetailsViewController(indexPath: IndexPath) {
        let viewModel = cities[indexPath.row]
        coordinator?.pushCityDetailsViewController(viewModel: viewModel)
    }
    
    private func fetchWeather() {
        guard let lat = coordinate?.latitude,
              let lon = coordinate?.longitude
        else {
            return
        }
        
        let coordinate = City.Coordination(lat: lat, lon: lon)
        
        cityListUseCase.getCitiesInCircle(coordinate, range: citiesInRange) { [weak self] (citiesInRange) in
            guard let self = self else { return }
            citiesInRange.list.forEach({ self.cities.append(CityViewModel(city: $0)) })
            self.delegate?.didUpdateDataSource()
        }
    }
}
