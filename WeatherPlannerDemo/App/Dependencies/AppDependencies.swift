import Reachability
import Resolver

class AppDependencies: AppModuleProtocol {
    
    static let shared = AppDependencies()

    private let modules: [AppModuleProtocol] = [
        NetworkModule(),
        CoreDataModule()
    ]
    
    lazy var appRouter: AppCoordinator = {
        return Resolver.custom.resolve()
    }()

    func registerDependencies(in container: Resolver) {
        modules.forEach { $0.registerDependencies(in: container) }
        registerAppDependencies(in: container)
    }
    
    private func registerAppDependencies(in container: Resolver) {
        registerRouters(in: container)
        registerServices(in: container)
        registerRepositories(in: container)
        registerUseCases(in: container)
        registerPresenters(in: container)
        registerViewControllers(in: container)
    }
    
    private func registerRouters(in container: Resolver) {
        container
            .register(name: RootNavigationController.navigationControllerRoot.rawValue) {
                UINavigationController()
            }
            .scope(Resolver.application)
        
        container
            .register { _ -> AppCoordinator in
                let rootNavigationController = container.resolve(
                    UINavigationController.self,
                    name: RootNavigationController.navigationControllerRoot.rawValue)
                    
                return AppCoordinator(navigationController: rootNavigationController, container: container)
            }
            .scope(Resolver.application)
        
        container
            .register(CoordinatorProtocol.self) {
                let appCoordinator: AppCoordinator = container.resolve()
                return appCoordinator
            }
            .scope(Resolver.application)
    }
    
    private func registerServices(in container: Resolver) {
        container
            .register { _ -> Reachability? in
                do {
                    return try Reachability()
                } catch let error {
                    Logger.print(string: "Unable to start notifier: \(error.localizedDescription)")
                    return nil
                }
            }
            .scope(Resolver.unique)
    }
    
    private func registerRepositories(in container: Resolver) {
        container
            .register { CityListRepository() }
            .implements(CityListRepositoryProtocol.self)
            .scope(Resolver.application)
        
        container
            .register { CityDetailsRepository() }
            .implements(CityDetailsRepositoryProtocol.self)
            .scope(Resolver.unique)
    }
    
    private func registerUseCases(in container: Resolver) {
        container
            .register { CityListUseCase() }
            .implements(CityListUseCaseProtocol.self)
            .scope(Resolver.application)
        
        container
            .register { CityDetailsUseCase() }
            .implements(CityDetailsUseCaseProtocol.self)
            .scope(Resolver.unique)
    }

    private func registerInteractors(in container: Resolver) {
        container
            .register { CityListInteractor() }
            .implements(CityListInteractorProtocol.self)
            .scope(Resolver.unique)
    }
    
    private func registerPresenters(in container: Resolver) {
        container
            .register { CityListPresenter() }
            .scope(Resolver.application)
        
        container
            .register { (_, args) in CityDetailsPresenter(cityViewModel: args()) }
            .scope(Resolver.unique)
    }
    
    private func registerViewControllers(in container: Resolver) {
        container
            .register { CityListViewController() }
            .scope(Resolver.application)
        
        container
            .register { (_, args) -> CityDetailsViewController in
                let cityDetailsVC = CityDetailsViewController()
                cityDetailsVC.$presenter.args = args()
                return cityDetailsVC
            }
            .scope(Resolver.unique)
    }
    
    private enum RootNavigationController: String {
        case navigationControllerRoot = "NavigationController.Root"
    }
}
