import Foundation

class CityDetailsUseCase: CityDetailsUseCaseProtocol {
    private let cityDetailsRepository: CityDetailsRepositoryProtocol
    
    init(cityDetailsRepository: CityDetailsRepositoryProtocol) {
        self.cityDetailsRepository = cityDetailsRepository
    }
    
    func getPollutionInfo(
        coordination: City.Coordination,
        cityID: Int,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: AirPollution) -> Void
    ) {
        cityDetailsRepository.fetchPollutionInfo(
            coordination: coordination,
            cityID: cityID,
            resultHandler: resultHandler)
    }
}
