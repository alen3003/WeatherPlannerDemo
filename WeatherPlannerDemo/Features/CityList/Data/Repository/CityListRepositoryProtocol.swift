import RxSwift

protocol CityListRepositoryProtocol {

    func fetchCities(latitude: Double, longitude: Double, range: Int) -> Observable<[City]>

}
