import Foundation
import CoreData

@objc(CDCoordination)
public class CDCoordination: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCoordination> {
        return NSFetchRequest<CDCoordination>(entityName: "CDCoordination")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
    @NSManaged public var city: CDCity?
}
