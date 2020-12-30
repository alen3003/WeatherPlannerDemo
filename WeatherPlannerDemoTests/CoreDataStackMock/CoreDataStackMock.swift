import CoreData

@testable import WeatherPlannerDemo

class CoreDataStackMock: CoreDataStackProtocol {
    public private(set) lazy var mainContext: NSManagedObjectContext = {
        return NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }()
    
    public private(set) lazy var privateContext: NSManagedObjectContext = {
        return NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
    }()
    
    func saveContextSnyc() {}
    
    func saveContextAsync(onCompleted completed: @escaping (Bool, Error?) -> Void) {}
    
}
