import RxDataSources

class AirPollutionDetailsViewModel {
    let name: String
    let mark: String
    let value: String
    
    init(name: String, mark: String, value: String) {
        self.name = name
        self.mark = mark
        self.value = value
    }
}

extension AirPollutionDetailsViewModel: IdentifiableType, Equatable {
    typealias Identity = String
    var identity: Identity {
        return name
    }
    
    static func == (lhs: AirPollutionDetailsViewModel, rhs: AirPollutionDetailsViewModel) -> Bool {
        return lhs.identity == rhs.identity
    }
}
