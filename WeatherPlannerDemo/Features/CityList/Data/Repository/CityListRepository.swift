import Foundation
import Reachability
import Resolver
import RxSwift

class CityListRepository: CityListRepositoryProtocol {

    @Injected(container: .custom) private var networkClient: CityListApiClientProtocol
    @Injected(container: .custom) private var coreDataService: CoreDataServiceProtocol
    @OptionalInjected(container: .custom) private var reachability: Reachability?

    func fetchCities(latitude: Double, longitude: Double, range: Int) -> Observable<[City]> {
        switch reachability?.connection {
        case .unavailable:
            return coreDataService.fetchCities()
        default:
            let coordination = City.Coordination(lat: latitude, lon: longitude)

            return networkClient.fetchCitiesInCircle(coordination, range: range)
                .do { [weak self] cities in
                    guard let self = self else { return }

                    self.saveToDatabase(cities: cities)
                }.flatMap { [weak self] _ -> Observable<[City]> in
                    guard let self = self else { return .just([]) }

                    return self.coreDataService.fetchCities()
                }
        }
    }

    private func saveToDatabase(cities: CitiesInCircle) {
        coreDataService.deleteCities()
        coreDataService.createCitiesFrom(cities: cities.list)
        coreDataService.saveChangesSync()
    }

}
