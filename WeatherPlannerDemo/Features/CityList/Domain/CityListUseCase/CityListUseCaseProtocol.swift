import Foundation

protocol CityListUseCaseProtocol {
    func getCitiesInCircle(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (_ cities: [City]) -> Void
    )
}
