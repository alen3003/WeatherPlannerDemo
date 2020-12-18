import Foundation
import CoreData

class CoreDataService: CoreDataServiceProtocol {
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    func fetchCities() -> [CDCity] {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            return try coreDataStack.context.fetch(request)
        } catch let error {
            Logger.print(string: "Failed faching data from database: \(error.localizedDescription)")
            return []
        }
    }
    
    func deleteCities() {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let results = try coreDataStack.context.fetch(request)
            for object in results {
                coreDataStack.context.delete(object)
            }
        } catch let error {
            Logger.print(string: "Detele all data error: \(error.localizedDescription)")
        }
    }
    
    @discardableResult
    func createCitiesFrom(cities: [City]) -> [CDCity]? {
        let cities: [CDCity] = cities.map({
            let city = CDCity(context: coreDataStack.context)
            city.populate(city: $0, context: coreDataStack.context)
            return city
        })

        return cities
    }
    
    func saveChangesAsync() {
        coreDataStack.context.perform {
            self.coreDataStack.saveContext()
        }
    }
    
    func saveChangesSync() {
        coreDataStack.context.performAndWait {
            coreDataStack.saveContext()
        }
    }
}
