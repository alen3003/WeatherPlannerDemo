import Foundation

enum ApiEndpoints: String {

    case base = "http://api.openweathermap.org/data/2.5"
    case weather = "/weather"
    case citiesInCircle = "/find"

}

enum ApiKey: String {
    case main = "3a6b1ca960c863988d6b372db2c203e6"
}
