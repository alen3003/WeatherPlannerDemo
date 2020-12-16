import Foundation

protocol CityDetailsUseCaseProtocol {
    func getPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: AirPollution) -> Void
    )
}
