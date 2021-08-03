import RxSwift

protocol CityListApiClientProtocol {

    func fetchCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<CitiesInCircle>

}
