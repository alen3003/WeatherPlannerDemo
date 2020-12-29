import Resolver

class AppCoordinator: CoordinatorProtocol {
    private weak var navigationController: UINavigationController?
    let container: Resolver
    
    init(navigationController: UINavigationController, container: Resolver) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func pushCityDetailsViewController(viewModel: CityViewModel) {
        let cityDetailsViewController: CityDetailsViewController = container.resolve(
            CityDetailsViewController.self,
            args: viewModel
        )
        navigationController?.pushViewController(cityDetailsViewController, animated: true)
    }
    
    private func setRootViewController() {
        let cityListController: CityListViewController = container.resolve()
        navigationController?.viewControllers = [cityListController]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension AppCoordinator {
    func presentInWindow(window: UIWindow) {
        setRootViewController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
