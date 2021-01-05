import CoreData
import Resolver
import RxSwift

@testable import WeatherPlannerDemo

class CityDetailsUseCaseMock: CityDetailsUseCaseProtocol {
    func getPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<AirPollution?> {
        return .just(AirPollutionMock.airPollution)
    }
}
