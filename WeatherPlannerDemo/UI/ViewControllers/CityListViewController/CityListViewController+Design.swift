import UIKit
import PureLayout

extension CityListViewController: ConstructViewsProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        citiesTableView = UITableView()
        view.addSubview(citiesTableView)
    }
    
    func styleViews() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = cityListViewModelList.title
    }
    
    func defineLayoutForViews() {
        citiesTableView.autoPinEdgesToSuperviewEdges()
    }
}
