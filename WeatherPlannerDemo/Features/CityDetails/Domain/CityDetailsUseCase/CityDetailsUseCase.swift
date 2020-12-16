import Foundation

class CityDetailsUseCase: CityDetailsUseCaseProtocol {
    private let cityDetailsRepository: CityDetailsRepositoryProtocol
    
    init(cityDetailsRepository: CityDetailsRepositoryProtocol) {
        self.cityDetailsRepository = cityDetailsRepository
    }
    
    func getPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: AirPollution) -> Void
    ) {
        cityDetailsRepository.fetchPollutionInfo(coordination: coordination, resultHandler: resultHandler)
    }
}
