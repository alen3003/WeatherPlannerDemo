import CoreLocation
import RxSwift

final class CityListPresenter {

    var cities: Observable<[CityViewModel]> {
        return coordinateSubject.asObservable().flatMap { [weak self] coordinate -> Observable<[CityViewModel]> in
            guard let self = self else { return .just([]) }
            return self.fetchWeather(coordinate: coordinate)
        }
    }
    
    var title: String {
        return LocalizationKey.helloMessage.string
    }
    
    private let coordinateSubject: PublishSubject<CLLocationCoordinate2D> = PublishSubject()
    weak var coordinator: CoordinatorProtocol?
    private var cityListUseCase: CityListUseCaseProtocol
    
    init(cityListUseCase: CityListUseCaseProtocol, coordinator: CoordinatorProtocol) {
        self.cityListUseCase = cityListUseCase
        self.coordinator = coordinator
    }
    
    func setLocation(coordinate: CLLocationCoordinate2D) {
        coordinateSubject.onNext(coordinate)
    }
    
    func openDetails(cityViewModel: CityViewModel) {
        coordinator?.pushCityDetailsViewController(viewModel: cityViewModel)
    }
    
    private func fetchWeather(coordinate: CLLocationCoordinate2D) -> Observable<[CityViewModel]> {
        let coordinate = City.Coordination(lat: coordinate.latitude, lon: coordinate.longitude)
        return cityListUseCase.getCitiesInCircle(
            coordinate,
            range: Constants.noOfCitiesInCircle).map { citiesInCircle in
            citiesInCircle.list.map({ CityViewModel(city: $0) })
        }
    }
}
