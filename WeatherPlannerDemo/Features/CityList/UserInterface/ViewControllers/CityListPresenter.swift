import Foundation
import CoreLocation

final class CityListPresenter {
    
    var title: String?
    var cities: [CityViewModel] = []
    
    weak var delegate: Completable?
    private var cityListUseCase: CityListUseCase
    
    private var citiesInRange = 30
    private var coordinate: CLLocationCoordinate2D?
    
    init(withDependencies dependencies: AppDependencies = AppDependencies()) {
        self.cityListUseCase = dependencies.cityListUseCase
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
    
    private func fetchWeather() {
        guard let coordinate = coordinate else { return }
        
        cityListUseCase.fetchCitiesInCircle(coordinate, range: citiesInRange) { [weak self] (citiesInRange) in
            guard let self = self else { return }
            citiesInRange.list.forEach({ self.cities.append(CityViewModel(city: $0)) })
            self.delegate?.didUpdateDataSource()
        }
    }
}
