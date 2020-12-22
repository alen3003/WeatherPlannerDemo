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
    
    func fetchCities(_ coordinate: City.Coordination, range: Int) -> Observable<CitiesInCircle> {
        switch reachability?.connection {
        case .unavailable:
            //fetchCities(resultHandler: resultHandler)
            return Observable<CitiesInCircle>.never()
        default:
            return networkClient.fetchCitiesInCircle(coordinate, range: range)
        }
    }
    
    private func saveCitiesAndFetch(cities: [City], resultHandler: @escaping ([City]) -> Void) {
        coreDataService.deleteCities()
        coreDataService.saveChangesSync()
        coreDataService.createCitiesFrom(cities: cities)
        coreDataService.saveChangesAsync { [weak self] (success, _) in
            guard success else { return }
            self?.fetchCities(resultHandler: resultHandler)
        }
    }
    
    private func fetchCities(resultHandler: @escaping ([City]) -> Void) {
        let cities = coreDataService.fetchCities().map({ City(cdCity: $0) })
        resultHandler(cities)
    }
}
