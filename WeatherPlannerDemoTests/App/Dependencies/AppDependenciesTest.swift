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
        container.register { CoreDataStackMock() }.implements(CoreDataStackProtocol.self)
        container.register { CoordinatorMock() }.implements(CoordinatorProtocol.self)
    }
    
    private func registerUseCases(in container: Resolver) {
        container.register { CityListUseCaseMock() }.implements(CityListUseCaseProtocol.self)
        container.register { CityDetailsUseCaseMock() }.implements(CityDetailsUseCaseProtocol.self)
    }
    
    private func registerPresenters(in container: Resolver) {
        container.register { CityListPresenter() }
        container.register { (_, args) in CityDetailsPresenter(cityViewModel: args()) }
    }
}
