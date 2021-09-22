import Resolver
import RxSwift

class CityListInteractor: CityListInteractorProtocol {

    @Injected(container: .custom)
    private var networkClient: CityListApiClientProtocol

    func fetchCities(
        latitude: Double,
        longitude: Double,
        range: Int
    ) -> Observable<[City]> {
        let coordination = City.Coordination(lat: latitude, lon: longitude)

        return networkClient
            .fetchCitiesInCircle(coordination, range: range)
            .map { $0.list }
    }

}
