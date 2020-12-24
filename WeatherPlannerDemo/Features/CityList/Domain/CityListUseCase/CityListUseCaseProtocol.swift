import RxSwift

protocol CityListUseCaseProtocol {
    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<[CDCity]>
}
