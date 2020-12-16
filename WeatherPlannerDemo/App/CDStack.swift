import Foundation
import CoreData

class CDStack {
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherPlannerModel")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                Logger.print(string: "Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch let error {
                Logger.print(string: "Unable to save changes to context: \(error.localizedDescription)")
            }
        }
    }
    
}
