import RxSwift

protocol CityDetailsUseCaseProtocol {

    func getPollutionInfo(latitude: Double, longitude: Double, cityID: Int) -> Observable<AirPollution?>

}
