import CoreData
import Resolver
import RxSwift

@testable import WeatherPlannerDemo

class CityListUseCaseMock: CityListUseCaseProtocol {
    
    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<[City]> {
        return .just([
            CityMock.city,
            CityMock.city,
            CityMock.city
        ])
    }
}
