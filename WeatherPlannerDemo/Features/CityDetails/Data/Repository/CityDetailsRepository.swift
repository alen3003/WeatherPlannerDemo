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

    func fetchPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<AirPollutionWrapper> {
        switch reachability?.connection {
        case .unavailable:
            //let city = coreDataService.fetchCityWithID(cityID)
            //fetchAirPollutionForCity(city, resultHandler: resultHandler)
            return Observable<AirPollutionWrapper>.never()
        default:
            return networkClient.fetchPollutionInfo(coordination: coordination)
        }
    }
    
    private func saveAirPollutionAndFetch(
        airPollution: AirPollution,
        cityID: Int,
        resultHandler: @escaping (_ airPollution: AirPollution) -> Void
    ) {
        let city = coreDataService.fetchCityWithID(cityID)
        coreDataService.deleteAirPollutionsForCity(city)
        coreDataService.createAirPollutionFrom(pollution: airPollution, city: city)
        coreDataService.saveChangesSync()
        fetchAirPollutionForCity(city, resultHandler: resultHandler)
    }
    
    private func fetchAirPollutionForCity(
        _ city: CDCity,
        resultHandler: @escaping (_ airPollution: AirPollution) -> Void
    ) {
        guard let airPollution = coreDataService.fetchAirPollutionForCity(city) else { return }
        resultHandler(AirPollution(cdAirPollution: airPollution))
    }
    
}
