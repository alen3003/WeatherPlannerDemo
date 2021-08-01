import PureLayout

extension CityListViewController: ConstructViewsProtocol {

    func buildViews() {
        createViews()
        styleViews()
        defineLayoutForViews()
    }

    func createViews() {
        citiesTableView = UITableView()
        citiesTableView.register(
            CityListTableViewCell.self,
            forCellReuseIdentifier: CityListTableViewCell.reuseIdentifier)
        view.addSubview(citiesTableView)
        citiesTableView.rx.setDelegate(self).disposed(by: disposeBag)
    }

    func styleViews() {
        navigationItem.title = presenter.title

        citiesTableView.separatorStyle = .none
    }

    func defineLayoutForViews() {
        citiesTableView.autoPinEdgesToSuperviewEdges()
    }

}
