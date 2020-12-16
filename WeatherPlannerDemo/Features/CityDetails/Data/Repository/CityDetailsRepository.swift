import Foundation

class CityDetailsRepository: CityDetailsRepositoryProtocol {

    private let networkClient: CityDetailsApiClientProtocol
    
    init(networkClient: CityDetailsApiClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: AirPollution) -> Void
    ) {
        networkClient.fetchPollutionInfo(coordination: coordination, resultHandler: resultHandler)
    }

}
