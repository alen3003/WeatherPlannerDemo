import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityListPresenterTests: XCTestCase {
    
    @LazyInjected(container: .main) private var coordinator: CoordinatorProtocol
    @LazyInjected(container: .main) private var cityListUseCase: CityListUseCaseProtocol
    
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        Resolver.main.register { CoreDataStackMock() }.implements(CoreDataStackProtocol.self)
        Resolver.main.register { CoordinatorMock() }.implements(CoordinatorProtocol.self)
        Resolver.main.register { CityListUseCaseMock() }.implements(CityListUseCaseProtocol.self)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func testQueryCitiesInCircle() throws {
        let citiesCount = cityListUseCase
            .getCitiesInCircle(City.Coordination(lat: 0, lon: 0), range: 0)
            .map({ $0.count })
        
        expect(try citiesCount.toBlocking().first()) == 3
    }

}
