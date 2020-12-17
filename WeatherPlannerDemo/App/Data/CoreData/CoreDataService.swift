import Foundation
import CoreData

class CoreDataService: CoreDataServiceProtocol {
    private let cdStack: CDStack
    
    init(cdStack: CDStack) {
        self.cdStack = cdStack
    }
    
    func fetchCities() -> [CDCity] {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.returnsObjectsAsFaults = false
        var cdCities: [CDCity] = []
        
        do {
            cdCities = try cdStack.context.fetch(request)
        } catch let error {
            Logger.print(string: "Failed faching data from database: \(error.localizedDescription)")
        }
        return cdCities
    }
    
    func deleteCities() {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let results = try cdStack.context.fetch(request)
            for object in results {
                //guard let objectData = object as? NSManagedObject else {continue}
                cdStack.context.delete(object)
            }
        } catch let error {
            print("Detele all data error :", error)
        }
    }
    
    @discardableResult
    func createCitiesFrom(cities: [City]) -> CDCitiesInCircle? {
        let citiesInCircle = CDCitiesInCircle(context: cdStack.context)
        cities.forEach({
            let city = CDCity(context: cdStack.context)
            city.populate(city: $0, citiesInCircle: citiesInCircle, context: cdStack.context)
            citiesInCircle.addToCities(city)
        })
        return citiesInCircle
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
