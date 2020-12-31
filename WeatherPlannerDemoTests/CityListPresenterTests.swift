import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityListPresenterTests: XCTestCase {

    private var presenter: CityListPresenter!
    
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        Resolver.custom.register { CoordinatorMock() }.implements(CoordinatorProtocol.self)
        Resolver.custom.register { CityListUseCaseMock() }.implements(CityListUseCaseProtocol.self)
        Resolver.custom.register { CoreDataStackMock() }.implements(CoreDataStackProtocol.self)
        
        presenter = CityListPresenter()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        
        presenter = nil
        disposeBag = nil
    }
    
    func testQueryCitiesInCircle() throws {
        let cities = presenter
            .fetchWeather(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        
        let citiesCount = cities.map({ $0.count })
        
        expect(try citiesCount.toBlocking().first()) == 3
        expect(try cities.toBlocking().first()).to(beAnInstanceOf([CityViewModel].self))
        
    }

}
