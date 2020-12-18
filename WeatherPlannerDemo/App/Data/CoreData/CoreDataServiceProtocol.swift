import Foundation

protocol CoreDataServiceProtocol {
    func fetchCities() -> [CDCity]
    func deleteCities()
    @discardableResult
    func createCitiesFrom(cities: [City]) -> [CDCity]?
    func saveChangesAsync()
    func saveChangesSync()
}
