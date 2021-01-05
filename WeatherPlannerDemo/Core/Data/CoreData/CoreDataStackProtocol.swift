import CoreData

protocol CoreDataStackProtocol {
    
    var persistentContainer: NSPersistentContainer { get }
    var mainContext: NSManagedObjectContext { get }
    var privateContext: NSManagedObjectContext { get }
    
    func saveContextSnyc()
    func saveContextAsync(onCompleted completed: @escaping (_ success: Bool, _ error: Error?) -> Void)
    
}
