import RxSwift

protocol CoreDataServiceProtocol {
    func fetchCities() -> Observable<[CDCity]>
    func fetchCityWithID(_ id: Int) -> CDCity?
    func fetchAirPollutionForCity(withID id: Int) -> Observable<CDAirPollution?>
    
    func deleteCities()
    func deleteAirPollutionsForCity(city: CDCity)
    
    @discardableResult
    func createCitiesFrom(cities: [City]) -> [CDCity]?
    @discardableResult
    func createAirPollutionFrom(pollution: AirPollution, city: CDCity) -> CDAirPollution
    
    func saveChangesSync()
    func saveChangesAsync(onCompleted completed: @escaping (_ success: Bool, _ error: Error?) -> Void)
}
