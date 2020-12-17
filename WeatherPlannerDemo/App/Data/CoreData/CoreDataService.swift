import Foundation
import CoreData

class CoreDataService: CoreDataServiceProtocol {
    private let cdStack: CDStack
    
    init(cdStack: CDStack) {
        self.cdStack = cdStack
    }
    
    func fetchCities() -> [CDCity] {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        var cdCities: [CDCity] = []
        
        do {
            cdCities = try cdStack.context.fetch(request)
        } catch let error {
            Logger.print(string: "Failed faching data from database: \(error.localizedDescription)")
        }
        return cdCities
    }
    
    @discardableResult
    func createCitiesFrom(cities: [City]) -> [CDCity]? {
        let cdCities: [CDCity] = cities.map({
            let city = CDCity(context: cdStack.context)
            city.populate(city: $0, context: cdStack.context)
            return city
        })
        return cdCities
    }
    
    func saveChangesAsync() {
        if cdStack.context.hasChanges {
            cdStack.context.perform {
                do {
                    try self.cdStack.context.save()
                } catch let error {
                    Logger.print(string: "Unable to save changes to context: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func saveChangesSync() {
        if cdStack.context.hasChanges {
            cdStack.context.performAndWait {
                do {
                    try self.cdStack.context.save()
                } catch let error {
                    Logger.print(string: "Unable to save changes to context: \(error.localizedDescription)")
                }
            }
        }
    }
}
