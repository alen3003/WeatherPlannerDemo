import Foundation

protocol CityDetailsRepositoryProtocol {
    func fetchPollutionInfoFromNetwork(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: [AirPollutionDetailsViewModel]) -> Void
    )
}
