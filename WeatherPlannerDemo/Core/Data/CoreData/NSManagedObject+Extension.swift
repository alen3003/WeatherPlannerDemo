import CoreData

extension NSManagedObject {
    
    class func firstOrCreate(withPredicate predicate: NSPredicate, context: NSManagedObjectContext) -> Self? {
        guard let request: NSFetchRequest<Self> = Self.fetchRequest() as? NSFetchRequest<Self> else { return nil }
        request.predicate = predicate
        request.returnsObjectsAsFaults = false
        
        do {
            let fetched = try context.fetch(request)
            
            guard let old = fetched.first else {
                let new = Self(context: context)
                return new
            }
            
            return old
        } catch {
            return nil
        }
    }
    
    class func createObject(context: NSManagedObjectContext) -> Self? {
        return Self(context: context)
    }
}
