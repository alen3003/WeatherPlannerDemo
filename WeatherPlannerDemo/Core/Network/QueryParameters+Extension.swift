protocol QueryParameters {

    func propertyPairs() -> [String: String]

}

extension QueryParameters {

    func propertyPairs() -> [String: String] {
        var pairs: [String: String] = [:]

        for case let (label?, value) in Mirror(reflecting: self).children {
            pairs[label] = value as? String
        }

        return pairs
    }

}
