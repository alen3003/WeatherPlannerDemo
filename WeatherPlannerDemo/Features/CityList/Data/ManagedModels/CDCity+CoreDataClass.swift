import Foundation
import CoreData

@objc(CDCity)
public class CDCity: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCity> {
        return NSFetchRequest<CDCity>(entityName: "CDCity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String
    @NSManaged public var airPollution: CDAirPollution?
    @NSManaged public var coordination: CDCoordination
    @NSManaged public var temperature: CDTemperature
    @NSManaged public var weather: CDWeather
    @NSManaged public var wind: CDWind
    @NSManaged public var citiesInCircle: CDCitiesInCircle?
    
    func populate(city: City, context: NSManagedObjectContext) {
        self.id = Int32(city.id)
        self.name = city.name
        self.coordination = createCoordination(coordination: city.coord, context: context)
        self.temperature = createTemperature(temperature: city.main, context: context)
        self.weather = createWeather(weather: city.weather[0], context: context)
        self.wind = createWind(wind: city.wind, context: context)
    }
}

extension CDCity {
    func createCoordination(coordination: City.Coordination, context: NSManagedObjectContext) -> CDCoordination {
        let cdCoordination = CDCoordination(context: context)
        cdCoordination.populate(coordination: coordination)
        return cdCoordination
    }
    
    func createTemperature(temperature: City.TemperatureInfo, context: NSManagedObjectContext) -> CDTemperature {
        let cdTemperature = CDTemperature(context: context)
        cdTemperature.populate(temperature: temperature)
        return cdTemperature
    }
    
    func createWeather(weather: City.WeatherInfo, context: NSManagedObjectContext) -> CDWeather {
        let cdWeather = CDWeather(context: context)
        cdWeather.populate(weather: weather)
        return cdWeather
    }
    
    func createWind(wind: City.WindInfo, context: NSManagedObjectContext) -> CDWind {
        let cdWind = CDWind(context: context)
        cdWind.populate(wind: wind)
        return cdWind
    }
}
