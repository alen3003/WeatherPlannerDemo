import Foundation

class CityDetailsRepository: CityDetailsRepositoryProtocol {

    private let networkClient: CityDetailsApiClientProtocol
    
    init(networkClient: CityDetailsApiClientProtocol) {
        self.networkClient = networkClient
    }

    func fetchPollutionInfoFromNetwork(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: [AirPollutionDetailsViewModel]) -> Void
    ) {
        networkClient.fetchPollutionInfo(coordination: coordination, resultHandler: resultHandler)
    }

}
