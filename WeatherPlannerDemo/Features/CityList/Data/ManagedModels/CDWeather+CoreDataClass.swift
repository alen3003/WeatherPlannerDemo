import Foundation
import CoreData

@objc(CDWeather)
public class CDWeather: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeather> {
        return NSFetchRequest<CDWeather>(entityName: "CDWeather")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String?
    @NSManaged public var weatherDescription: String?
    @NSManaged public var city: CDCity?
}
