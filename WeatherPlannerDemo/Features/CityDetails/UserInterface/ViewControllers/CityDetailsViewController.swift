import UIKit
import Resolver
import RxCocoa
import RxDataSources
import RxSwift

class CityDetailsViewController: UIViewController {

    let headerHeight: CGFloat = 250
    
    var cityDetailsTableView: UITableView!
    
    @LazyInjected(container: .custom) var presenter: CityDetailsPresenter
    
    private typealias CityDetailsTableViewDataSource =
        RxTableViewSectionedReloadDataSource<Section<AirPollutionDetailsViewModel>>
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()
        
        cityDetailsTableView.rx.setDelegate(self).disposed(by: disposeBag)
        registerTableViewCells()
        configureDataSource()
    }
    
    private func registerTableViewCells() {
        cityDetailsTableView.register(
            CityDetailsTableViewCell.self,
            forCellReuseIdentifier: CityDetailsTableViewCell.reuseIdentifier)
    }
    
    private func configureDataSource() {
        let dataSource = CityDetailsTableViewDataSource(
            configureCell: { (_, tableView, indexPath, viewModel) in
                guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: CityDetailsTableViewCell.reuseIdentifier,
                        for: indexPath) as? CityDetailsTableViewCell
                else {
                    return UITableViewCell()
                }
                
                cell.set(viewModel: viewModel)
                return cell
            }
        )
        
        presenter
            .airPollutionDetails
            .mapToSection()
            .observeOn(MainScheduler.instance)
            .bind(to: cityDetailsTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension CityDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let viewModel = presenter.cityViewModel else { return nil }

        let headerView = CityDetailsHeaderView()
        headerView.set(viewModel: viewModel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        headerHeight
    }
}
