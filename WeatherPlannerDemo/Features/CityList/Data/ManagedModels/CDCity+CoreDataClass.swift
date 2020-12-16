import Foundation
import CoreData

@objc(CDCity)
public class CDCity: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCity> {
        return NSFetchRequest<CDCity>(entityName: "CDCity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var airPollution: CDAirPollution?
    @NSManaged public var coordination: CDCoordination?
    @NSManaged public var temperature: CDTemperature?
    @NSManaged public var weather: CDWeather?
    @NSManaged public var wind: CDWind?
    @NSManaged public var citiesInCircle: CDCitiesInCircle?
}
