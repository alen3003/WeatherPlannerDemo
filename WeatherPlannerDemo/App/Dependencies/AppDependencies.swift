import Foundation
import Reachability

class AppDependencies: CityDependenciesProtocol {
    
    var cityListUseCase: CityListUseCaseProtocol!
    var cityDetailsUseCase: CityDetailsUseCaseProtocol!
    
    lazy var reachability: Reachability? = {
        do {
            return try Reachability()
        } catch let error {
            Logger.print(string: "Unable to start notifier: \(error.localizedDescription)")
            return nil
        }
    }()
    
    lazy var networkModule = {
        return NetworkModule()
    }()
    
    lazy var coreDataStack: CoreDataStack = {
        return CoreDataStack(containerName: "WeatherPlannerModel")
    }()
    
    lazy var coreDataService: CoreDataService = {
        return CoreDataService(coreDataStack: coreDataStack)
    }()
    
    init() {
        cityListUseCase = buildCityListUseCase()
        cityDetailsUseCase = buildCityDetilsUseCase()
    }
    
    func buildCityListUseCase() -> CityListUseCaseProtocol {
        let networkClient = networkModule.registerCityListApiClient()
        let repository = CityListRepository(
            networkClient: networkClient,
            coreDataService: coreDataService,
            reachability: reachability)
        
        return CityListUseCase(cityListRepository: repository)
    }
    
    func buildCityDetilsUseCase() -> CityDetailsUseCaseProtocol {
        let networkClient = networkModule.registerCityDetailsApiClient()
        let repository = CityDetailsRepository(
            networkClient: networkClient,
            coreDataService: coreDataService,
            reachability: reachability)
        
        return CityDetailsUseCase(cityDetailsRepository: repository)
    }
}
