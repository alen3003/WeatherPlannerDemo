import Foundation
import Reachability

extension Reachability {
    func startReachability() {
        do {
            try self.startNotifier()
        } catch let error {
            Logger.print(string: "Unable to start notifier: \(error.localizedDescription)")
        }
    }
    
    func endReachability() {
        self.stopNotifier()
    }
}
