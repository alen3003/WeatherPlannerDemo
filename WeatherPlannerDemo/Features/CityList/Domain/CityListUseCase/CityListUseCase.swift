import Foundation
import CoreLocation

class CityListUseCase {
    private let cityListRepository: CityListRepository
    
    init(cityListRepository: CityListRepository) {
        self.cityListRepository = cityListRepository
    }
    
    func fetchCitiesInCircle(
        _ coordinate: CLLocationCoordinate2D,
        range: Int,
        resultHandler: @escaping (_ cities: CitiesInCircle) -> Void
    ) {
        cityListRepository.fetchCitiesInCircle(coordinate, range: range, resultHandler: resultHandler)
    }
}
