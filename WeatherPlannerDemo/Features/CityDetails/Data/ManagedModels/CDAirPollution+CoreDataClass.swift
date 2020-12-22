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
    
    func populate(airPollution: AirPollution, city: CDCity?, context: NSManagedObjectContext) {
        self.aqi = Int16(airPollution.main.aqi)
        self.co = airPollution.components.co
        self.nh3 = airPollution.components.nh3
        self.no = airPollution.components.no
        self.no2 = airPollution.components.no2
        self.o3 = airPollution.components.o3
        self.so2 = airPollution.components.so2
        self.city = city
    }
}
