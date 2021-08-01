import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityListPresenterTests: XCTestCase {

    @OptionalInjected(container: .custom) var presenter: CityListPresenter!
    var disposeBag: DisposeBag!

    override func setUp() {
        disposeBag = DisposeBag()
    }

    override func tearDown() {
        presenter = nil
        disposeBag = nil
    }
    
    func testQueryCitiesInCircle() {
        let citiesCount = presenter
            .fetchWeather(coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
            .map { $0.count }
        
        expect(try citiesCount.toBlocking().first()) == 3
        
    }
    
    func testSetLocation() {
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
