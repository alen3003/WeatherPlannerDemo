import Foundation

class CityListUseCase: CityListUseCaseProtocol {
    private let cityListRepository: CityListRepositoryProtocol
    
    init(cityListRepository: CityListRepositoryProtocol) {
        self.cityListRepository = cityListRepository
    }
    
    func getCitiesInCircle(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (_ cities: [City]) -> Void
    ) {
        cityListRepository.fetchCities(coordinate, range: range, resultHandler: resultHandler)
    }
}
