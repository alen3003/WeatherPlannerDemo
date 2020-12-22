import RxSwift
import CoreLocation

final class CityListPresenter {

    var cities: Observable<[CityViewModel]>?
    
    weak var coordinator: CoordinatorProtocol?
    private var cityListUseCase: CityListUseCaseProtocol
    private var citiesInRange = 15
    private var coordinate: CLLocationCoordinate2D?
    var title: String?
    
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
    
    func openDetails(cityViewModel: CityViewModel) {
        coordinator?.pushCityDetailsViewController(viewModel: cityViewModel)
    }
    
    private func fetchWeather() {
        guard let lat = coordinate?.latitude,
              let lon = coordinate?.longitude
        else {
            return
        }
        
        let coordinate = City.Coordination(lat: lat, lon: lon)
        
        cities = cityListUseCase.getCitiesInCircle(coordinate, range: citiesInRange).map { citiesInCircle in
            citiesInCircle.list.map({ CityViewModel(city: $0) })
        }
        
        
        
        /*cityListUseCase.getCitiesInCircle(coordinate, range: citiesInRange) { [weak self] (cities) in
            guard let self = self else { return }
            cities.forEach({ self.cities.append(CityViewModel(city: $0)) })
            self.delegate?.didUpdateDataSource()
        }*/
    }
}
