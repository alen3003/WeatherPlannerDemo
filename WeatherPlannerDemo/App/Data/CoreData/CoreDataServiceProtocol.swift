import Foundation

protocol CoreDataServiceProtocol {
    func fetchCities() -> [CDCity]
    func fetchCityWithID(_ id: Int) -> CDCity
    func fetchAirPollutionForCity(_ city: CDCity) -> CDAirPollution?
    
    func deleteCities()
    func deleteAirPollutionsForCity(_ city: CDCity)
    
    @discardableResult
    func createCitiesFrom(cities: [City]) -> [CDCity]?
    @discardableResult
    func createAirPollutionFrom(pollution: AirPollution, city: CDCity?) -> CDAirPollution?
    
    func saveChangesAsync()
    func saveChangesSync()
}
