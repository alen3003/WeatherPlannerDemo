import Foundation

class Predicates {
    class func idPredicate(_ id: Int) -> NSPredicate {
        return NSPredicate(format: "id = %d", id)
    }
    
    class func airPollutionPredicate(_ city: CDCity) -> NSPredicate {
        return NSPredicate(format: "city = %@", city)
    }
}
