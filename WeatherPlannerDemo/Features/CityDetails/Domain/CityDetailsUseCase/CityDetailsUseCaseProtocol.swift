import Foundation

protocol CityDetailsUseCaseProtocol {
    func getPollutionInfo(
        coordination: City.Coordination,
        cityID: Int,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: AirPollution) -> Void
    )
}
