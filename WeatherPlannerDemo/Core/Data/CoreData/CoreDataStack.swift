import Foundation
import CoreData

class CoreDataStack: CoreDataStackProtocol {
    
    var containerName: String
    
    init(containerName: String) {
        self.containerName = containerName
    }

    public private(set) lazy var context: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    public private(set) lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                Logger.print(string: "Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        guard context.hasChanges else { return }
        context.performAndWait {
            do {
                try self.context.save()
            } catch let error {
                Logger.print(string: "Unable to save changes to context: \(error.localizedDescription)")
            }
        }
    }
}
