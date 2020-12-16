import Foundation
import CoreData

@objc(CDCitiesInCircle)
public class CDCitiesInCircle: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCitiesInCircle> {
        return NSFetchRequest<CDCitiesInCircle>(entityName: "CDCitiesInCircle")
    }

    @NSManaged public var count: Int16
    @NSManaged public var cities: NSSet?
}

// MARK: Generated accessors for cities
extension CDCitiesInCircle {

    @objc(addCitiesObject:)
    @NSManaged public func addToCities(_ value: CDCity)

    @objc(removeCitiesObject:)
    @NSManaged public func removeFromCities(_ value: CDCity)

    @objc(addCities:)
    @NSManaged public func addToCities(_ values: NSSet)

    @objc(removeCities:)
    @NSManaged public func removeFromCities(_ values: NSSet)

}
