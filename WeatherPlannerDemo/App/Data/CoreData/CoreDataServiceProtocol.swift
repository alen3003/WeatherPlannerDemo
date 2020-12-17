import Foundation

protocol CoreDataServiceProtocol {
    func fetchCities() -> [CDCity]
    @discardableResult
    func createCitiesFrom(cities: [City]) -> [CDCity]? 
    func saveChangesAsync()
    func saveChangesSync()
}
