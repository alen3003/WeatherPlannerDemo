import Foundation
import Reachability
import RxSwift

class CityDetailsRepository: CityDetailsRepositoryProtocol {

    private let networkClient: CityDetailsApiClientProtocol
    private let coreDataService: CoreDataServiceProtocol
    private var reachability: Reachability?
    
    init(networkClient: CityDetailsApiClientProtocol,
         coreDataService: CoreDataServiceProtocol,
         reachability: Reachability?
    ) {
        self.networkClient = networkClient
        self.coreDataService = coreDataService
        self.reachability = reachability
        
        self.reachability?.startReachability()
    }

    func fetchPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<CDAirPollution?> {
        switch reachability?.connection {
        case .unavailable:
            return coreDataService.fetchAirPollutionForCity(withID: cityID)
        default:
            return networkClient.fetchPollutionInfo(coordination: coordination)
                .do { [weak self] airPollutionWrapper in
                    guard let self = self,
                          let airPollution = airPollutionWrapper.list.first
                    else {
                        return
                    }
                    
                    self.createAndSaveAirPollution(from: airPollution, cityID: cityID)
                }.flatMap { _ -> Observable<CDAirPollution?> in
                    return self.coreDataService.fetchAirPollutionForCity(withID: cityID)
                }
        }
    }
    
    private func createAndSaveAirPollution(from airPollution: AirPollution, cityID: Int) {
        guard let city = coreDataService.fetchCityWithID(cityID) else { return }
        coreDataService.deleteAirPollutionsForCity(city: city)
        coreDataService.createAirPollutionFrom(pollution: airPollution, city: city)
        coreDataService.saveChangesSync()
    }
}
