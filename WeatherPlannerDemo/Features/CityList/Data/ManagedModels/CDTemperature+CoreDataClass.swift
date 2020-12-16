import Foundation
import CoreData

@objc(CDTemperature)
public class CDTemperature: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTemperature> {
        return NSFetchRequest<CDTemperature>(entityName: "CDTemperature")
    }

    @NSManaged public var feelsLike: Float
    @NSManaged public var humidity: Float
    @NSManaged public var temp: Float
    @NSManaged public var tempMax: Float
    @NSManaged public var tempMin: Float
    @NSManaged public var city: CDCity?
}
