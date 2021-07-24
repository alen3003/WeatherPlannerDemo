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
    
    func populate(temperature: City.TemperatureInfo) {
        self.feelsLike = temperature.feels_like
        self.humidity = temperature.humidity
        self.temp = temperature.temp
        self.tempMax = temperature.temp_max
        self.tempMin = temperature.temp_min
    }
}
