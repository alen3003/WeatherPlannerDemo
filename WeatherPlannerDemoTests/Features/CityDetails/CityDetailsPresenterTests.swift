import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityDetailsPresenterTests: XCTestCase {
    
    @OptionalInjected(container: .custom) private var presenter: CityDetailsPresenter!
    
    private var cityViewModel: CityViewModel!

    override func setUpWithError() throws {
        cityViewModel = CityViewModel(city: CityMock.city)
        presenter = CityDetailsPresenter(cityViewModel: cityViewModel)
    }

    override func tearDownWithError() throws {
        presenter = nil
        cityViewModel = nil
    }
    
    func testQueryAirPollution() throws {
        let airPollutionDetailsCount = presenter
            .fetchPollutionInfo()
            .map { $0.count }
        
        expect(try airPollutionDetailsCount.toBlocking().first()) ==
            AirPollutionViewModel.AirPollutionLabelType.allCases.count
        
    }

}
