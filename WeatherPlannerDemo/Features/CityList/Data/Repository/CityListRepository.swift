import Foundation
import Reachability

class CityListRepository: CityListRepositoryProtocol {
    private let networkClient: CityListApiClientProtocol
    private let coreDataService: CoreDataServiceProtocol
    private var reachability: Reachability?
    
    init(networkClient: CityListApiClientProtocol,
         coreDataService: CoreDataServiceProtocol,
         reachability: Reachability?
    ) {
        self.networkClient = networkClient
        self.coreDataService = coreDataService
        self.reachability = reachability
        
        reachability?.startReachability()
    }
    
    func fetchCities(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (CitiesInCircle) -> Void
    ) {
        switch reachability?.connection {
        case .unavailable:
            fetchCities(resultHandler: resultHandler)
        default:
            networkClient.fetchCitiesInCircle(coordinate, range: range) { [weak self] (cities) in
                self?.saveCitiesAndFetch(cities: cities, resultHandler: resultHandler)
            }
        }
    }
    
    private func saveCitiesAndFetch(cities: CitiesInCircle, resultHandler: @escaping (CitiesInCircle) -> Void) {
        coreDataService.deleteCities()
        coreDataService.createCitiesFrom(cities: cities.list)
        coreDataService.saveChangesSync()
        fetchCities(resultHandler: resultHandler)
    }
    
    private func fetchCities(resultHandler: @escaping (CitiesInCircle) -> Void) {
        let cdCities = coreDataService.fetchCities().map({ City(cdCity: $0) })
        let citiesInCircle = CitiesInCircle(count: cdCities.count, list: cdCities)
        resultHandler(citiesInCircle)
    }
}
