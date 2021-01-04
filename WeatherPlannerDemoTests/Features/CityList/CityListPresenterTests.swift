import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift
import RxTest

@testable import WeatherPlannerDemo

class CityListPresenterTests: XCTestCase {

    @OptionalInjected(container: .custom) var presenter: CityListPresenter!
    let disposeBag = DisposeBag()

    override func setUpWithError() throws {
        try super.setUpWithError()
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
    
    func testSetLocation() throws {
        let scheduler = TestScheduler(initialClock: 0, resolution: 1)
        
        scheduler.scheduleAt(10) {
            self.presenter.setLocation(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
        }
        
        let observer = scheduler
            .record(
                presenter.cities.map { $0.count },
                disposeBag: disposeBag)
        
        scheduler.start()
        
        expect(observer.events) == [.next(10, 3)]
    }

}
