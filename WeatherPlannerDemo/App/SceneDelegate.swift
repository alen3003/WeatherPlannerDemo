import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        
        let cityListViewController = CityListViewController(presenter: CityListPresenter())
        let cityListNavigationController = UINavigationController(rootViewController: cityListViewController)
        window?.rootViewController = cityListNavigationController
        window?.makeKeyAndVisible()
    }

}
