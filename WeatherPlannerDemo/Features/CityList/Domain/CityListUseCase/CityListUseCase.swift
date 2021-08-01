import Resolver
import RxSwift

class CityListUseCase: CityListUseCaseProtocol {

    @Injected(container: .custom) private var cityListRepository: CityListRepositoryProtocol

    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<[CityModel]> {
        cityListRepository
            .fetchCities(coordinate, range: range)
            .map { $0.map { CityModel(from: $0) } }
    }

}
