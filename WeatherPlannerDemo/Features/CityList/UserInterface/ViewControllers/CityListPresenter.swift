import CoreLocation
import Resolver
import RxSwift

class CityListPresenter {

    @Injected(container: .custom) private var cityListUseCase: CityListUseCaseProtocol
    @Injected(container: .custom) private var coordinator: CoordinatorProtocol

    private let coordinateSubject: PublishSubject<CLLocationCoordinate2D> = PublishSubject()

    var cities: Observable<[CityViewModel]> {
        return coordinateSubject.asObservable().flatMap { [weak self] coordinate -> Observable<[CityViewModel]> in
            guard let self = self else { return .just([]) }
            return self.fetchWeather(coordinate: coordinate)
        }
    }

    var title: String {
        LocalizationKey.helloMessage.string
    }

    func setLocation(coordinate: CLLocationCoordinate2D) {
        coordinateSubject.onNext(coordinate)
    }

    func openDetails(cityViewModel: CityViewModel) {
        coordinator.pushCityDetailsViewController(viewModel: cityViewModel)
    }

    func fetchWeather(coordinate: CLLocationCoordinate2D) -> Observable<[CityViewModel]> {
        let coordinate = City.Coordination(lat: coordinate.latitude, lon: coordinate.longitude)
        return cityListUseCase.getCitiesInCircle(
            coordinate,
            range: Constants.noOfCitiesInCircle)
            .flatMap({ cities -> Observable<[CityViewModel]> in
                return Observable<[CityViewModel]>.just(cities.map({ CityViewModel(city: $0) }))
            })
    }

}
