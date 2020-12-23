import UIKit

extension CityDetailsViewController: ConstructViewsProtocol {
    
    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }
    
    func createViews() {
        cityDetailsTableView = UITableView()
        cityDetailsTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityDetailsTableView)
    }
    
    func styleViews() {
        //navigationItem.title = presenter.title
        
        cityDetailsTableView.separatorStyle = .none
    }
    
    func defineLayoutForViews() {
        NSLayoutConstraint.activate([
            cityDetailsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            cityDetailsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            cityDetailsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cityDetailsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
