import Resolver
import RxSwift

class CityListUseCase: CityListUseCaseProtocol {

    @Injected(container: .custom) private var cityListRepository: CityListRepositoryProtocol

    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<[City]> {
        cityListRepository.fetchCities(coordinate, range: range)
    }

}
