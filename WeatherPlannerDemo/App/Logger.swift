import Foundation

class Logger {
    static func print(string: String) {
        #if DEBUG
        Swift.print(string)
        #endif
    }
}
