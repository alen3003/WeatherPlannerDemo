import CoreData
import Resolver
import RxSwift

@testable import WeatherPlannerDemo

class CityDetailsUseCaseMock: CityDetailsUseCaseProtocol {
    
    @Injected(container: .custom) private var coreDataStack: CoreDataStackProtocol
    
    func getPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<CDAirPollution?> {
        return .just(CDAirPollution(context: coreDataStack.mainContext))
    }
}
