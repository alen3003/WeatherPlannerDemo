import RxSwift

protocol CityListInteractorProtocol {

    func fetchCities(latitude: Double, longitude: Double, range: Int) -> Observable<[City]>

}
