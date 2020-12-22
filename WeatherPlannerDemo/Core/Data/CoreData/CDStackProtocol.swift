import CoreData

protocol CoreDataStackProtocol {
    func saveContextSnyc()
    func saveContextAsync(onCompleted completed: @escaping (_ success: Bool, _ error: Error?) -> Void)
}
