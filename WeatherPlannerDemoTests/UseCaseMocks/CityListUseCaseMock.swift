import Resolver
import RxSwift

@testable import WeatherPlannerDemo

class CityListUseCaseMock: CityListUseCaseProtocol {
    
    @Injected(container: .custom) private var coreDataStack: CoreDataStackProtocol
    
    // MARK: - queryAllCities

    var queryAllCitiesReturnValue: Observable<[CDCity]>!
    func queryAllCities() -> Observable<[CDCity]> {
        return queryAllCitiesReturnValue
    }
    
    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<[CDCity]> {
        let city1 = CDCity(context: coreDataStack.mainContext)
        let city2 = CDCity(context: coreDataStack.mainContext)
        let city3 = CDCity(context: coreDataStack.mainContext)
        
        return .just([city1, city2, city3])
    }
}
