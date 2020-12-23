import RxSwift

class CityDetailsUseCase: CityDetailsUseCaseProtocol {
    private let cityDetailsRepository: CityDetailsRepositoryProtocol
    
    init(cityDetailsRepository: CityDetailsRepositoryProtocol) {
        self.cityDetailsRepository = cityDetailsRepository
    }
    
    func getPollutionInfo(coordination: City.Coordination, cityID: Int) -> Observable<AirPollutionWrapper> {
        return cityDetailsRepository.fetchPollutionInfo(coordination: coordination, cityID: cityID)
    }
}
