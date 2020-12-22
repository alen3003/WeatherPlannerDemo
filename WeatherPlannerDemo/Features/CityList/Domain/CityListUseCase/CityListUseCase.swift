import RxSwift

class CityListUseCase: CityListUseCaseProtocol {
    private let cityListRepository: CityListRepositoryProtocol
    
    init(cityListRepository: CityListRepositoryProtocol) {
        self.cityListRepository = cityListRepository
    }
    
    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<CitiesInCircle> {
        return cityListRepository.fetchCities(coordinate, range: range)
    }
}
