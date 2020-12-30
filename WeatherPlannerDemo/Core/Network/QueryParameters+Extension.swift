protocol QueryParameters {
    func propertyPairs() -> [String: String]
}

extension QueryParameters {
    func propertyPairs() -> [String: String] {
        var pairs: [String: String] = [:]
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            pairs[label] = value as? String
        }
        return pairs
    }
}
