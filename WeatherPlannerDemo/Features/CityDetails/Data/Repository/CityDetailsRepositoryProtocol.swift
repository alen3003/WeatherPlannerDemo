import Foundation

protocol CityDetailsRepositoryProtocol {
    func fetchPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: [AirPollutionDetailsViewModel]) -> Void
    )
}
