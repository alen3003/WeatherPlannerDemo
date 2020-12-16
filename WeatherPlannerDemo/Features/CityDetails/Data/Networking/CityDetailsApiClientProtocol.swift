import Foundation

protocol CityDetailsApiClientProtocol {
    func fetchPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: AirPollution) -> Void
    )
}
