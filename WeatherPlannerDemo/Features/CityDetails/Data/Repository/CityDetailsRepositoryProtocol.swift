import RxSwift

protocol CityDetailsRepositoryProtocol {

    func fetchPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<AirPollution?>

}
