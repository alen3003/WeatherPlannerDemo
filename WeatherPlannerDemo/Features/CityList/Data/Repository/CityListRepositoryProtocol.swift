import Foundation

protocol CityListRepositoryProtocol {
    func fetchCitiesFromNetwork(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (_ cities: CitiesInCircle) -> Void
    )
}
