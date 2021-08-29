extension Array where Element: StubProtocol {

    static func stub(withCount count: Int) -> Array {
        (1...count).map {
            .stub(withId: $0)
        }
    }

}
