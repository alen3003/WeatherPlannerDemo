import XCTest
import CoreData
import Nimble
import Resolver
import RxBlocking
import RxSwift

@testable import WeatherPlannerDemo

class CityDetailsPresenterTests: XCTestCase {
    
    private var presenter: CityDetailsPresenter!
    
    private var temperature: City.TemperatureInfo!
    private var wind: City.WindInfo!
    private var coordination: City.Coordination!
    private var city: City!
    private var cityViewModel: CityViewModel!

    override func setUpWithError() throws {
        Resolver.custom.register { CityDetailsUseCaseMock() }.implements(CityDetailsUseCaseProtocol.self)
        Resolver.custom.register { CoreDataStackMock() }.implements(CoreDataStackProtocol.self)
        
        temperature = City.TemperatureInfo(
            temp: 0,
            feels_like: 0,
            temp_min: 0,
            temp_max: 0,
            humidity: 0)
        
        wind = City.WindInfo(speed: 0, deg: 0)
        
        coordination = City.Coordination(lat: 0, lon: 0)
        
        city = City(
            id: 1,
            weather: [],
            main: temperature,
            wind: wind,
            name: "",
            coord: coordination)
        
        cityViewModel = CityViewModel(city: city)
        presenter = CityDetailsPresenter(cityViewModel: cityViewModel)
    }

    override func tearDownWithError() throws {
        presenter = nil
        temperature = nil
        wind = nil
        coordination = nil
        city = nil
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
