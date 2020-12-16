import UIKit

class AppCoordinator: CoordinatorProtocol {
    private let navigationController = UINavigationController()
    private let appDependencies = AppDependencies()
    private var window: UIWindow!
    
    init(window: UIWindow) {
        setRootViewController()
        presentInWindow(window: window)
    }
    
    func pushCityDetailsViewController(viewModel: CityViewModel) {
        let cityDetailsViewController = createCityDetailsViewController(viewModel: viewModel)
        navigationController.pushViewController(cityDetailsViewController, animated: true)
    }
    
    private func setRootViewController() {
        let cityListController = createCityListController()
        navigationController.viewControllers = [cityListController]
    }
    
    private func createCityListController() -> CityListViewController {
        let presenter = CityListPresenter(
            cityListUseCase: appDependencies.buildCityListUseCase(),
            coordinator: self)
        return CityListViewController(presenter: presenter)
    }
    
    private func createCityDetailsViewController(viewModel: CityViewModel) -> CityDetailsViewController {
        let presenter = CityDetailsPresenter(
            cityDetailsUseCase: appDependencies.buildCityDetilsUseCase(),
            cityViewModel: viewModel)
        return CityDetailsViewController(presenter: presenter)
    }
}

private extension AppCoordinator {
    func presentInWindow(window: UIWindow) {
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
