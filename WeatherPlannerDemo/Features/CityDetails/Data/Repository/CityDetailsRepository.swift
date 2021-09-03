import Reachability
import Resolver
import RxSwift

class CityDetailsRepository: CityDetailsRepositoryProtocol {

    @Injected(container: .custom) private var networkClient: CityDetailsApiClientProtocol
    @Injected(container: .custom) private var coreDataService: CoreDataServiceProtocol
    @OptionalInjected(container: .custom) private var reachability: Reachability?

    func fetchPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<AirPollution?> {
        switch reachability?.connection {
        case .unavailable:
            return coreDataService.fetchAirPollutionForCity(withID: cityID)
        default:
            return networkClient.fetchPollutionInfo(coordination: coordination)
                .do { [weak self] airPollutionWrapper in
                    guard
                        let self = self,
                        let airPollution = airPollutionWrapper.list.first
                    else {
                        return
                    }
                    
                    self.createAndSaveAirPollution(from: airPollution, cityID: cityID)
                }.flatMap { [weak self] _ -> Observable<AirPollution?> in
                    guard let self = self else { return .just(nil) }
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
