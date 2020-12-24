import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class CityDetailsViewController: UIViewController {
    
    var cityDetailsTableView: UITableView!
    
    public typealias CityDetailsTableViewDataSource =
        RxTableViewSectionedAnimatedDataSource<AnimatableSection<AirPollutionDetailsViewModel>>
    
    let presenter: CityDetailsPresenter
    let disposeBag = DisposeBag()
    
    init(presenter: CityDetailsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

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
            animationConfiguration: AnimationConfiguration(
                insertAnimation: .fade,
                reloadAnimation: .fade,
                deleteAnimation: .fade),
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
        
        presenter.airPollutionDetails
            .mapToAnimatableSection()
            .observeOn(MainScheduler.instance)
            .bind(to: cityDetailsTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension CityDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = CityDetailsHeaderView()
        headerView.set(viewModel: presenter.cityViewModel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 250
    }
}
