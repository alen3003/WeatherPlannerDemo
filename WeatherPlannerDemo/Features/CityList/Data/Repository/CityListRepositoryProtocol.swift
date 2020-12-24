import RxSwift

protocol CityListRepositoryProtocol {
    func fetchCities(_ coordinate: City.Coordination, range: Int) -> Observable<[CDCity]>
}
