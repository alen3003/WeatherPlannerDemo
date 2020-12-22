import Foundation
import CoreData

class CoreDataStack: CoreDataStackProtocol {
    
    var containerName: String
    
    init(containerName: String) {
        self.containerName = containerName
    }
    
    public private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                Logger.print(string: "Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    public private(set) lazy var mainContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    public private(set) lazy var privateContext: NSManagedObjectContext = {
        return persistentContainer.newBackgroundContext()
    }()
    
    func saveContextSnyc() {
        guard mainContext.hasChanges else { return }
        mainContext.performAndWait { [weak self] in
            do {
                try self?.mainContext.save()
            } catch let error {
                Logger.print(string: "Unable to save changes to context sync: \(error.localizedDescription)")
            }
        }
    }
    
    func saveContextAsync(onCompleted completed: @escaping (_ success: Bool, _ error: Error?) -> Void) {
        guard privateContext.hasChanges else { return }
        privateContext.perform { [weak self] in
            do {
                try self?.privateContext.save()
                completed(true, nil)
            } catch let error {
                Logger.print(string: "Unable to save changes to context async: \(error.localizedDescription)")
                completed(false, error)
            }
        }
    }
}
