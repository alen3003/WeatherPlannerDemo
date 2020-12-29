import Resolver
import Reachability

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
        container.register(name: AppNavigationController.navigationControllerRoot.rawValue) {
            UINavigationController()
        }
        .scope(Resolver.application)
        
        container.register { _ -> AppCoordinator in
            let rootNavigationController = container.resolve(
                UINavigationController.self,
                name: AppNavigationController.navigationControllerRoot.rawValue)
                
            return AppCoordinator(navigationController: rootNavigationController, container: container)
        }
        .scope(Resolver.application)
        
        container.register(CoordinatorProtocol.self) {
            let appCoordinator: AppCoordinator = container.resolve()
            return appCoordinator
        }
        .scope(Resolver.application)
    }
    
    private func registerServices(in container: Resolver) {
        container.register { _ -> Reachability? in
            do {
                return try Reachability()
            } catch let error {
                Logger.print(string: "Unable to start notifier: \(error.localizedDescription)")
                return nil
            }
        }
        .scope(Resolver.shared)
    }
    
    private func registerRepositories(in container: Resolver) {
        container.register(CityListRepositoryProtocol.self) {
            CityListRepository()
        }
        .scope(Resolver.application)
        
        container.register(CityDetailsRepositoryProtocol.self) {
            CityDetailsRepository()
        }
        .scope(Resolver.application)
    }
    
    private func registerUseCases(in container: Resolver) {
        container.register(CityListUseCaseProtocol.self) {
            CityListUseCase()
        }
        .scope(Resolver.application)
        
        container.register(CityDetailsUseCaseProtocol.self) {
            CityDetailsUseCase()
        }
        .scope(Resolver.application)
    }
    
    private func registerPresenters(in container: Resolver) {
        container.register { _ -> CityListPresenter in
            return CityListPresenter()
        }
        .scope(Resolver.application)
        
        container.register { (_, args) -> CityDetailsPresenter in
            let presenter = CityDetailsPresenter(cityViewModel: args())
            return presenter
        }
        .scope(Resolver.unique)
    }
    
    private func registerViewControllers(in container: Resolver) {
        container.register {
            CityListViewController()
        }
        .scope(Resolver.application)
        
        container.register { (_, args) -> CityDetailsViewController in
            let cityDetailsVC = CityDetailsViewController()
            cityDetailsVC.$presenter.args = args()
            return cityDetailsVC
        }
        .scope(Resolver.unique)
    }
    
    private enum AppNavigationController: String {
        case navigationControllerRoot = "NavigationController.Root"
    }
}
