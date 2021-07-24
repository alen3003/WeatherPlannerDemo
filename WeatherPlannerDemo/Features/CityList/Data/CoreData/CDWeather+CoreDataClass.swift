import Foundation
import CoreData

@objc(CDWeather)
public class CDWeather: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeather> {
        return NSFetchRequest<CDWeather>(entityName: "CDWeather")
    }

    @NSManaged public var id: Int32
    @NSManaged public var title: String
    @NSManaged public var weatherDescription: String
    @NSManaged public var city: CDCity?
    
    func populate(weather: City.WeatherInfo) {
        self.id = Int32(weather.id)
        self.title = weather.main
        self.weatherDescription = weather.description
    }
}
