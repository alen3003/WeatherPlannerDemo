import Foundation
import CoreLocation

protocol CityListRepositoryProtocol {
    func fetchCitiesInCircle(
        _ coordinate: CLLocationCoordinate2D,
        range: Int,
        resultHandler: @escaping (_ cities: CitiesInCircle) -> Void
    )
}
