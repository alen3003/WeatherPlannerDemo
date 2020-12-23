import UIKit
import CoreLocation
import RxCocoa
import RxSwift

class CityListViewController: UIViewController {
    
    var citiesTableView: UITableView!
    
    let presenter: CityListPresenter
    var locationManager: CLLocationManager?
    let disposeBag = DisposeBag()
    
    init(presenter: CityListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildViews()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        askForLocationServicesIfNeeded()
        
        citiesTableView.rx.setDelegate(self).disposed(by: disposeBag)
        registerTableViewCells()
        configureDataSource()
        setOnClickEvent()
    }
    
    private func askForLocationServicesIfNeeded() {
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestWhenInUseAuthorization()
       
        if CLLocationManager.locationServicesEnabled() {
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.startUpdatingLocation()
        }
    }
    
    private func registerTableViewCells() {
        citiesTableView.register(
            CityListTableViewCell.self,
            forCellReuseIdentifier: CityListTableViewCell.reuseIdentifier
        )
    }
    
    private func configureDataSource() {
        presenter.cities
            .observeOn(MainScheduler.instance)
            .bind(to: citiesTableView.rx.items(
                    cellIdentifier: CityListTableViewCell.reuseIdentifier,
                    cellType: CityListTableViewCell.self)
            ) { _, viewModel, cell in
                cell.set(viewModel: viewModel)
            }.disposed(by: disposeBag)
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
        return 350
    }
}
