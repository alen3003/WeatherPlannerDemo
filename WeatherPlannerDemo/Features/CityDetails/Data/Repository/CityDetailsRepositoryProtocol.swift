import Foundation

protocol CityDetailsRepositoryProtocol {
    func fetchPollutionInfo(
        coordination: City.Coordination,
        cityID: Int,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: AirPollution) -> Void
    )
}
