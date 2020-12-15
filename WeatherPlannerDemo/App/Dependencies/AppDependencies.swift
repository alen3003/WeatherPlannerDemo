import Foundation

class AppDependencies: CityDependenciesProtocol {
    
    var cityListUseCase: CityListUseCase!
    var cityDetailsUseCase: CityDetailsUseCase!
    private let networkModule = NetworkModule()
    
    init() {
        cityListUseCase = buildCityListUseCase()
        cityDetailsUseCase = buildCityDetilsUseCase()
    }
    
    func buildCityListUseCase() -> CityListUseCase {
        let networkClient = networkModule.registerCityListApiClient()
        return CityListUseCase(cityListRepository: CityListRepository(networkClient: networkClient))
    }
    
    func buildCityDetilsUseCase() -> CityDetailsUseCase {
        let networkClient = networkModule.registerCityDetailsApiClient()
        return CityDetailsUseCase(cityDetailsRepository: CityDetailsRepository(networkClient: networkClient))
    }
}
