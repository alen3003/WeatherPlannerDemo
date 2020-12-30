import CoreData
import Resolver
import RxSwift

class CoreDataService: CoreDataServiceProtocol {
    
    @Injected(container: .custom) private var coreDataStack: CoreDataStackProtocol
    
    // MARK: - Fetches
    
    func fetchCities() -> Observable<[CDCity]> {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        request.returnsObjectsAsFaults = false
        
        return coreDataStack.mainContext.rx_entities(request as? NSFetchRequest<NSFetchRequestResult>)
            .flatMap { fetchedManagedObject -> Observable<[CDCity]> in
                guard let fetchedCities = fetchedManagedObject as? [CDCity] else { return .just([]) }
                return .just(fetchedCities)
            }
    }
    
    func fetchAirPollutionForCity(withID id: Int) -> Observable<CDAirPollution?> {
        
        guard let city = self.fetchCityWithID(id) else { return .just(nil) }
        
        let request: NSFetchRequest<CDAirPollution> = CDAirPollution.fetchRequest()
        request.predicate = Predicates.airPollutionPredicate(city)
        request.sortDescriptors = [NSSortDescriptor(key: "aqi", ascending: true)]
        request.returnsObjectsAsFaults = false
        
        return self.coreDataStack.mainContext.rx_entities(request as? NSFetchRequest<NSFetchRequestResult>)
            .flatMap { fetchedManagedObject -> Observable<CDAirPollution?> in
                guard let fetchedPollution = fetchedManagedObject.first as? CDAirPollution
                else {
                    return .just(nil)
                }
                return .just(fetchedPollution)
            }
    }
    
    // MARK: - Create CoreData Models
    
    func createCitiesFrom(cities: [City]) -> [CDCity] {
        let cities: [CDCity] = cities.map({
            let city = CDCity(context: coreDataStack.mainContext)
            city.populate(city: $0, context: coreDataStack.mainContext)
            return city
        })

        return cities
    }
    
    func createAirPollutionFrom(pollution: AirPollution, city: CDCity) -> CDAirPollution {
        let airPollution = CDAirPollution(context: coreDataStack.mainContext)
        airPollution.populate(airPollution: pollution, city: city, context: coreDataStack.mainContext)
        city.airPollution = airPollution
        return airPollution
    }
    
    // MARK: - Delete CoreData Models
    
    func deleteCities() {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try coreDataStack.mainContext.fetch(request)
            results.forEach({ [weak self] in self?.deleteObject($0) })
        } catch let error {
            Logger.print(string: "Detele air pollution data error: \(error.localizedDescription)")
        }
    }
    
    func deleteAirPollutionsForCity(city: CDCity) {
        let request: NSFetchRequest<CDAirPollution> = CDAirPollution.fetchRequest()
        request.predicate = Predicates.airPollutionPredicate(city)
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try self.coreDataStack.mainContext.fetch(request)
            results.forEach({ self.deleteObject($0) })
        } catch let error {
            Logger.print(string: "Detele air pollution data error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Save Changes
    
    func saveChangesSync() {
        coreDataStack.saveContextSnyc()
    }
    
    func saveChangesAsync(onCompleted completed: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        coreDataStack.saveContextAsync(onCompleted: completed)
    }
    
    // MARK: - Helpers
    
    private func deleteObject(_ object: NSManagedObject) {
        coreDataStack.mainContext.delete(object)
    }
    
    func fetchCityWithID(_ id: Int) -> CDCity? {
        let request: NSFetchRequest<CDCity> = CDCity.fetchRequest()
        request.predicate = Predicates.idPredicate(id)
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try coreDataStack.mainContext.fetch(request)
            guard let city = results.first else {
                return nil
            }
            return city
        } catch {
            Logger.print(string: "Fetch city with ID error: \(error.localizedDescription)")
            return nil
        }
    }
}
