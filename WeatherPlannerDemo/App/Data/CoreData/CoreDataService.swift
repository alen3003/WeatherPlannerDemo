import Foundation
import CoreData

class CoreDataService: CoreDataServiceProtocol {
    private let coreDataStack: CoreDataStack
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
    }
    
    //MARK: - Fetches
    
    func fetchCities() -> [CDCity] {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            return try coreDataStack.context.fetch(request)
        } catch let error {
            Logger.print(string: "Failed fetching data from database: \(error.localizedDescription)")
            return []
        }
    }
    
    func fetchCityWithID(_ id: Int) -> CDCity {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.predicate = Predicates.idPredicate(id)
        request.returnsObjectsAsFaults = false
        
        do {
            return try coreDataStack.context.fetch(request).first ?? CDCity()
        } catch let error {
            Logger.print(string: "Failed fetching data from database: \(error.localizedDescription)")
            return CDCity()
        }
    }
    
    func fetchAirPollutionForCity(_ city: CDCity) -> CDAirPollution? {
        let request: NSFetchRequest<CDAirPollution> = CDAirPollution.fetchRequest()
        request.predicate = Predicates.airPollutionPredicate(city)
        request.returnsObjectsAsFaults = false
        
        do {
            return try coreDataStack.context.fetch(request).first
        } catch let error {
            Logger.print(string: "Failed fetching data from database: \(error.localizedDescription)")
            return nil
        }
    }
    
    //MARK: - Create CoreData Models
    
    func createCitiesFrom(cities: [City]) -> [CDCity]? {
        let cities: [CDCity] = cities.map({
            let city = CDCity(context: coreDataStack.context)
            city.populate(city: $0, context: coreDataStack.context)
            return city
        })

        return cities
    }
    
    func createAirPollutionFrom(pollution: AirPollution, city: CDCity?) -> CDAirPollution? {
        let airPollution = CDAirPollution(context: coreDataStack.context)
        airPollution.populate(airPollution: pollution, city: city, context: coreDataStack.context)
        city?.airPollution = airPollution
        return airPollution
    }
    
    //MARK: - Delete CoreData Models
    
    func deleteCities() {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.returnsObjectsAsFaults = false
        do {
            let results = try coreDataStack.context.fetch(request)
            for object in results {
                coreDataStack.context.delete(object)
            }
        } catch let error {
            Logger.print(string: "Detele cities data error: \(error.localizedDescription)")
        }
    }
    
    func deleteAirPollutionsForCity(_ city: CDCity) {
        let request: NSFetchRequest<CDAirPollution> = CDAirPollution.fetchRequest()
        request.predicate = Predicates.airPollutionPredicate(city)
        request.returnsObjectsAsFaults = false
        do {
            let results = try coreDataStack.context.fetch(request)
            for object in results {
                coreDataStack.context.delete(object)
            }
        } catch let error {
            Logger.print(string: "Detele air pollution data error: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save Changes
    
    func saveChangesSync() {
        coreDataStack.saveContext()
    }
}
