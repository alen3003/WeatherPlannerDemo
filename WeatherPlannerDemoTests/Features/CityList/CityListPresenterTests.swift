import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityListPresenterTests: XCTestCase {

    @WeakLazyInjected(container: .custom) private var presenter: CityListPresenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        Resolver.custom.register { CoordinatorMock() }.implements(CoordinatorProtocol.self)
        Resolver.custom.register { CityListUseCaseMock() }.implements(CityListUseCaseProtocol.self)
        Resolver.custom.register { CoreDataStackMock() }.implements(CoreDataStackProtocol.self)
        Resolver.custom.register { CityListPresenter() }
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        presenter = nil
    }
    
    func testQueryCitiesInCircle() throws {
        let citiesCount = presenter
            .fetchWeather(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
            .map { $0.count }
        
        expect(try citiesCount.toBlocking().first()) == 3
        
    }

}
