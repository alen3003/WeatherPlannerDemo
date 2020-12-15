import Foundation

class CityListUseCase {
    private let cityListRepository: CityListRepository
    
    init(cityListRepository: CityListRepository) {
        self.cityListRepository = cityListRepository
    }
    
    func getCitiesInCircle(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (_ cities: CitiesInCircle) -> Void
    ) {
        cityListRepository.fetchCitiesFromNetwork(coordinate, range: range, resultHandler: resultHandler)
    }
}
