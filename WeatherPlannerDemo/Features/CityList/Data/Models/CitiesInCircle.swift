import Foundation

struct CitiesInCircle: Decodable {
    let count: Int
    let list: [City]
}

extension CitiesInCircle {
    init(cdCities: [CDCity]) {
        self.count = cdCities.count
        self.list = cdCities.map({ City(cdCity: $0) })
    }
}
