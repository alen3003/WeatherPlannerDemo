import Foundation

class CityListRepository: CityListRepositoryProtocol {
    private let networkClient: CityListApiClientProtocol
    
    init(networkClient: CityListApiClientProtocol = NetworkModule().registerCityListApiClient()) {
        self.networkClient = networkClient
    }
    
    func fetchCitiesFromNetwork(
        _ coordinate: City.Coordination,
        range: Int,
        resultHandler: @escaping (CitiesInCircle) -> Void
    ) {
        networkClient.fetchCitiesInCircle(coordinate, range: range, resultHandler: resultHandler)
    }
    
}
