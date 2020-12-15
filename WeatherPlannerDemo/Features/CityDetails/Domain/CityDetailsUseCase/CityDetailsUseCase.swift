import Foundation
import CoreLocation

class CityDetailsUseCase {
    private let cityDetailsRepository: CityDetailsRepository
    
    init(cityDetailsRepository: CityDetailsRepository) {
        self.cityDetailsRepository = cityDetailsRepository
    }
    
    func fetchPollutionInfo(
        coordination: City.Coordination,
        resultHandler: @escaping (_ airPollutionDetailsViewModel: [AirPollutionDetailsViewModel]) -> Void
    ) {
        cityDetailsRepository.fetchPollutionInfo(coordination: coordination, resultHandler: resultHandler)
    }
}
