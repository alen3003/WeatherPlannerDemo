import UIKit
import CoreLocation

class CityListViewController: UIViewController {
    
    var citiesTableView: UITableView!
    
    let presenter: CityListPresenter
    var locationManager: CLLocationManager?
    
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
        
        citiesTableView.delegate = self
        citiesTableView.dataSource = self
        
        presenter.delegate = self
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        registerTableViewCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        askForLocationServicesIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager?.stopUpdatingLocation()
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
}

extension CityListViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        presenter.setLocation(coordinate: locations[0].coordinate)
    }
}

extension CityListViewController: Completable {
    func didUpdateDataSource() {
        DispatchQueue.main.async { [weak self] in
            self?.citiesTableView.reloadData()
        }
    }
}

extension CityListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = citiesTableView.dequeueReusableCell(
                withIdentifier: CityListTableViewCell.reuseIdentifier,
                for: indexPath) as? CityListTableViewCell
        else { return UITableViewCell() }
        
        cell.set(viewModel: presenter.cities[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityDetailsPresenter = CityDetailsPresenter(cityViewModel: presenter.cities[indexPath.row])
        let cityDetailsViewController = CityDetailsViewController(cityDetailsPresenter: cityDetailsPresenter)
        self.navigationController?.pushViewController(cityDetailsViewController, animated: true)
    }
}