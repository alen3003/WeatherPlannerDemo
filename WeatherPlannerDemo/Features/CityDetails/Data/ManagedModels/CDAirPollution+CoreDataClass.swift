import Foundation
import CoreData

@objc(CDAirPollution)
public class CDAirPollution: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDAirPollution> {
        return NSFetchRequest<CDAirPollution>(entityName: "CDAirPollution")
    }

    @NSManaged public var aqi: Int16
    @NSManaged public var co: Double
    @NSManaged public var nh3: Double
    @NSManaged public var no: Double
    @NSManaged public var no2: Double
    @NSManaged public var o3: Double
    @NSManaged public var so2: Double
    @NSManaged public var city: CDCity?
}
