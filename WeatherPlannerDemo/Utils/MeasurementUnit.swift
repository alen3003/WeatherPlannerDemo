import Foundation

enum MeasurementUnit: String {
    case standard
    case metric
    case imperial
}

enum MeasurementUnitDescription: String {
    case velocityBasic = "m/s"
    case airPollutionLevel = "μg/m³"
    case celsius = "°"
}
