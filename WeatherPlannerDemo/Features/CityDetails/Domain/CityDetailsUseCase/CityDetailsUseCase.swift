import Resolver
import RxSwift

class CityDetailsUseCase: CityDetailsUseCaseProtocol {

    @Injected(container: .custom) private var cityDetailsRepository: CityDetailsRepositoryProtocol

    func getPollutionInfo(latitude: Double, longitude: Double, cityID: Int) -> Observable<AirPollution?> {
        return cityDetailsRepository.fetchPollutionInfo(
            coordination: City.Coordination(lat: latitude, lon: longitude),
            cityID: cityID)
    }

}
