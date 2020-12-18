import Foundation

protocol CityListRepositoryProtocol {
    func fetchCities(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (_ cities: [City]) -> Void
    )
}
