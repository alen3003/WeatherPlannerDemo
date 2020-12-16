import Foundation

class AppDependencies: CityDependenciesProtocol {
    
    var cityListUseCase: CityListUseCaseProtocol!
    var cityDetailsUseCase: CityDetailsUseCaseProtocol!
    private let networkModule = NetworkModule()
    
    init() {
        cityListUseCase = buildCityListUseCase()
        cityDetailsUseCase = buildCityDetilsUseCase()
    }
    
    func buildCityListUseCase() -> CityListUseCaseProtocol {
        let networkClient = networkModule.registerCityListApiClient()
        return CityListUseCase(cityListRepository: CityListRepository(networkClient: networkClient))
    }
    
    func buildCityDetilsUseCase() -> CityDetailsUseCaseProtocol {
        let networkClient = networkModule.registerCityDetailsApiClient()
        return CityDetailsUseCase(cityDetailsRepository: CityDetailsRepository(networkClient: networkClient))
    }
}
