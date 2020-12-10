import UIKit

class CityDetailsViewController: UIViewController {
    
    var cityDetailsTableView: UITableView!
    
    let cityDetailsViewModelList: CityDetailsViewModelList
    
    init(cityViewModel: CityViewModel) {
        cityDetailsViewModelList = CityDetailsViewModelList(cityViewModel: cityViewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        
        cityDetailsTableView.delegate = self
        cityDetailsTableView.dataSource = self
        
        cityDetailsViewModelList.delegate = self
        
        registerTableViewCells()
        
        cityDetailsViewModelList.fetchPollutionInfo()
    }
    
    private func registerTableViewCells() {
        cityDetailsTableView.register(
            CityDetailsTableViewCell.self,
            forCellReuseIdentifier: CityDetailsTableViewCell.reuseIdentifier
        )
    }
    
}

extension CityDetailsViewController: Completable {
    func didUpdateDataSource() {
        DispatchQueue.main.async { [weak self] in
            self?.cityDetailsTableView.reloadData()
        }
    }
}

extension CityDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityDetailsViewModelList.airPollutionViewModel?.airPollutionData().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = cityDetailsTableView.dequeueReusableCell(
                withIdentifier: CityDetailsTableViewCell.reuseIdentifier,
                for: indexPath) as? CityDetailsTableViewCell,
              let airPollutionViewModel = cityDetailsViewModelList.airPollutionViewModel
        else { return UITableViewCell() }
        
        cell.set(airPollutionViewModel.airPollutionData()[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CityDetailsHeaderView()
        headerView.set(viewModel: cityDetailsViewModelList.cityViewModel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}
