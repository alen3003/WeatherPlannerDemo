import RxSwift

protocol CityDetailsApiClientProtocol {

    func fetchPollutionInfo(coordination: City.Coordination) -> Observable<AirPollutionWrapper>

}
