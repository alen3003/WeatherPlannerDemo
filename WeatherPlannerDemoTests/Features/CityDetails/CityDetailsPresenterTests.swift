import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityDetailsPresenterTests: XCTestCase {
    
    @WeakLazyInjected(container: .custom) private var presenter: CityDetailsPresenter!

    override func setUpWithError() throws {
        $presenter.args = CityViewModelMock.viewModel
    }

    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func testQueryAirPollution() throws {
        let airPollutionDetailsCount = presenter
            .fetchPollutionInfo()
            .map { $0.count }
        
        expect(try airPollutionDetailsCount.toBlocking().first()) ==
            AirPollutionViewModel.AirPollutionLabelType.allCases.count
        
    }

}
