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
        navigationItem.title = presenter.title
        
        citiesTableView.separatorStyle = .none
    }
    
    func defineLayoutForViews() {
        citiesTableView.autoPinEdgesToSuperviewEdges()
    }
}
