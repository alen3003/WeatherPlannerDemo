import UIKit
import CoreLocation
import Resolver
import RxCocoa
import RxDataSources
import RxSwift

class CityListViewController: UIViewController {

    typealias CityListTableViewDataSource = RxTableViewSectionedAnimatedDataSource<AnimatableSection<CityViewModel>>

    @Injected(container: .custom) var presenter: CityListPresenter

    let rowHeight: CGFloat = 350

    var citiesTableView: UITableView!

    var locationManager: CLLocationManager?
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        buildViews()

        locationManager = CLLocationManager()
        locationManager?.delegate = self

        askForLocationServicesIfNeeded()

        configureDataSource()
        setOnClickEvent()
    }

    private func askForLocationServicesIfNeeded() {
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestWhenInUseAuthorization()

        guard CLLocationManager.locationServicesEnabled() else { return }

        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }

    private func configureDataSource() {
        let dataSource = CityListTableViewDataSource(
            animationConfiguration: AnimationConfiguration(
                insertAnimation: .fade,
                reloadAnimation: .fade,
                deleteAnimation: .fade),
            configureCell: { (_, tableView, indexPath, viewModel) in
                guard let cell = tableView.dequeueReusableCell(
                        withIdentifier: CityListTableViewCell.reuseIdentifier,
                        for: indexPath) as? CityListTableViewCell
                else {
                    return UITableViewCell()
                }
                
                cell.set(viewModel: viewModel)
                return cell
            }
        )
        
        presenter.cities
            .mapToAnimatableSection()
            .observeOn(MainScheduler.instance)
            .bind(to: citiesTableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
    
    private func setOnClickEvent() {
        citiesTableView.rx
            .modelSelected(CityViewModel.self)
            .subscribe(onNext: { [weak self] viewModel in
                guard let self = self else { return }
                self.presenter.openDetails(cityViewModel: viewModel)
           }).disposed(by: disposeBag)
    }
}

extension CityListViewController: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager?.stopUpdatingLocation()
        locationManager?.delegate = nil
        presenter.setLocation(coordinate: locations[0].coordinate)
    }

}

extension CityListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        rowHeight
    }

}
