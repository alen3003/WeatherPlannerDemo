import CoreData

@testable import WeatherPlannerDemo

class CoreDataStackMock: CoreDataStackProtocol {
    public private(set) lazy var persistentContainer: NSPersistentContainer = {
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        let persistentContainer = NSPersistentContainer(
            name: "TestingContainer",
            managedObjectModel: managedObjectModel)
        let description = NSPersistentStoreDescription()
        description.type = NSInMemoryStoreType
        persistentContainer.persistentStoreDescriptions = [description]
        persistentContainer.loadPersistentStores { (description, _) in
            precondition(description.type == NSInMemoryStoreType)
        }
        return persistentContainer
    }()
    
    public private(set) lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    public private(set) lazy var privateContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    func saveContextSnyc() {}
    
    func saveContextAsync(onCompleted completed: @escaping (Bool, Error?) -> Void) {}

}
