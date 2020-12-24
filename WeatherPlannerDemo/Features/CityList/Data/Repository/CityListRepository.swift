import Foundation
import Reachability
import RxSwift

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
        
        self.reachability?.startReachability()
    }
    
    func fetchCities(_ coordinate: City.Coordination, range: Int) -> Observable<[CDCity]> {
        switch reachability?.connection {
        case .unavailable:
            return self.coreDataService.fetchCities()
        default:
            return networkClient.fetchCitiesInCircle(coordinate, range: range)
                .do { [weak self] cities in
                    guard let self = self else { return }
                    self.createAndSaveCities(from: cities)
                }.flatMap { _ -> Observable<[CDCity]> in
                    return self.coreDataService.fetchCities()
                }
        }
    }
    
    private func createAndSaveCities(from citiesInCircle: CitiesInCircle) {
        coreDataService.deleteCities()
        coreDataService.createCitiesFrom(cities: citiesInCircle.list)
        coreDataService.saveChangesSync()
    }
}
