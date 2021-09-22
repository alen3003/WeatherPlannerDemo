import Resolver
import RxSwift

class CityListUseCase: CityListUseCaseProtocol {

    @Injected(container: .custom)
    private var cityListRepository: CityListRepositoryProtocol

    func getCitiesInCircle(
        latitude: Double,
        longitude: Double,
        range: Int
    ) -> Observable<[CityModel]> {
        cityListRepository
            .fetchCities(latitude: latitude, longitude: longitude, range: range)
            .map { $0.map { CityModel(from: $0) } }
    }

}
