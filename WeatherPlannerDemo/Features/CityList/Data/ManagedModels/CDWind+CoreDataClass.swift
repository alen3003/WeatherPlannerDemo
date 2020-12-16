import Foundation
import CoreData

@objc(CDWind)
public class CDWind: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWind> {
        return NSFetchRequest<CDWind>(entityName: "CDWind")
    }

    @NSManaged public var deg: Float
    @NSManaged public var speed: Float
    @NSManaged public var city: CDCity?
}
