import Resolver

@testable import WeatherPlannerDemo

class AppDependeciesTest: AppModuleProtocol {
    
    static let shared = AppDependeciesTest()
    
    func registerDependencies(in container: Resolver) {
        registerServices(in: container)
        registerUseCases(in: container)
        registerPresenters(in: container)
    }
    
    private func registerServices(in container: Resolver) {
        container
            .register { AppCoordinator(navigationController: UINavigationController(), container: .custom) }
            .implements(CoordinatorProtocol.self)
    }
    
    private func registerUseCases(in container: Resolver) {
        container.register(CityListUseCaseProtocol.self) {
            let useCase = CityListUseCaseProtocolMock()
            useCase.getCitiesInCircleLatitudeLongitudeRangeReturnValue = .just([CityModel].stub(withCount: 3))
            return useCase
        }

        container.register(CityDetailsUseCaseProtocol.self) {
            let useCase = CityDetailsUseCaseProtocolMock()
            useCase.getPollutionInfoLatitudeLongitudeCityIDReturnValue = .just(AirPollutionMock().airPollution)
            return useCase
        }
    }
    
    private func registerPresenters(in container: Resolver) {
        container.register { CityListPresenter() }
    }
}
