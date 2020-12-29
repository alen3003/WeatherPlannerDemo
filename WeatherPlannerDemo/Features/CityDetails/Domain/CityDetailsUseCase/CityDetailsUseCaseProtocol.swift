import RxSwift

protocol CityDetailsUseCaseProtocol {
    func getPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<CDAirPollution?>
}
