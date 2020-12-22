import Foundation

protocol CityListApiClientProtocol {
    func fetchCitiesInCircle(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (_ cities: [City]) -> Void
    )
}
