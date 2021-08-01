import RxSwift

protocol CityListUseCaseProtocol {

    func getCitiesInCircle(latitude: Double, longitude: Double, range: Int) -> Observable<[CityModel]>

}
