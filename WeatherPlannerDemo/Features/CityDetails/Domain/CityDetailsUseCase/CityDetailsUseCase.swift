import Foundation

class CityDetailsUseCase {
    private let cityDetailsRepository: CityDetailsRepository
    
    init(cityDetailsRepository: CityDetailsRepository) {
        self.cityDetailsRepository = cityDetailsRepository
    }
    
    func getPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: [AirPollutionDetailsViewModel]) -> Void
    ) {
        cityDetailsRepository.fetchPollutionInfoFromNetwork(coordination: coordination, resultHandler: resultHandler)
    }
}
