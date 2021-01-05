import Resolver
import RxSwift

class CityDetailsUseCase: CityDetailsUseCaseProtocol {
    
    @Injected(container: .custom) private var cityDetailsRepository: CityDetailsRepositoryProtocol
    
    func getPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<AirPollution?> {
        return cityDetailsRepository.fetchPollutionInfo(coordination: coordination, cityID: cityID)
    }
}
