import XCTest
import Resolver
import Nimble
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityDetailsPresenterTests: XCTestCase {
    
    @WeakLazyInjected(container: .custom) private var presenter: CityDetailsPresenter!

    override func setUp() {
        $presenter.args = CityViewModelMock.viewModel
    }

    override func tearDown() {
        presenter = nil
    }

    func testQueryAirPollution() {
        let airPollutionDetailsCount = presenter
            .fetchPollutionInfo()
            .map { $0.count }

        expect(try airPollutionDetailsCount.toBlocking().first()) == 7
        
    }

}
