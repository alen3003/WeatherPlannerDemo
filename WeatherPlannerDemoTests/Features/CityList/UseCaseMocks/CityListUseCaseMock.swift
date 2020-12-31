import CoreData
import Resolver
import RxSwift

@testable import WeatherPlannerDemo

class CityListUseCaseMock: CityListUseCaseProtocol {
    
    @Injected(container: .custom) private var coreDataStack: CoreDataStackProtocol
    
    func getCitiesInCircle(_ coordinate: City.Coordination, range: Int) -> Observable<[CDCity]> {
        
        let cities = [
            CDCity(context: coreDataStack.mainContext),
            CDCity(context: coreDataStack.mainContext),
            CDCity(context: coreDataStack.mainContext)
        ]
        
        return .just(cities)
    }
}
