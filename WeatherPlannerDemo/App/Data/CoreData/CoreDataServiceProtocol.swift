import Foundation

protocol CoreDataServiceProtocol {
    func fetchCities() -> [CDCity]
    func deleteCities()
    @discardableResult
    func createCitiesFrom(cities: [City]) -> CDCitiesInCircle?
    func saveChangesAsync()
    func saveChangesSync()
}
