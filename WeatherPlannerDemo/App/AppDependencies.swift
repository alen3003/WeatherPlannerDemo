import Foundation

class AppDependencies: CityDependenciesProtocol {
    
    var cityListUseCase: CityListUseCase!
    var cityDetailsUseCase: CityDetailsUseCase!
    
    init() {
        cityListUseCase = buildCityListUseCase()
        cityDetailsUseCase = buildCityDetilsUseCase()
    }
    
    func buildCityListUseCase() -> CityListUseCase {
        return CityListUseCase(cityListRepository: CityListRepository())
    }
    
    func buildCityDetilsUseCase() -> CityDetailsUseCase {
        return CityDetailsUseCase(cityDetailsRepository: CityDetailsRepository())
    }
}
