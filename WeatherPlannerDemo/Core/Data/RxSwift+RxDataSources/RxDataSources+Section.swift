import RxDataSources
import RxSwift

public class Section<T>: SectionModelType {
    public  var header: String?
    public var items: [T]

    public init(items: [T]) {
        self.items = items
    }

    required public init(original: Section<T>, items: [T]) {
        self.items = items
    }

    public var identity: String {
        return header ?? ""
    }

}

public class AnimatableSection<T>: AnimatableSectionModelType where T: IdentifiableType, T: Equatable {

    public var header: String?
    public var items: [T]

    public init(header: String, items: [T]) {
        self.header = header
        self.items = items
    }

    public init(items: [T]) {
        self.items = items
    }

    required public init(original: AnimatableSection<T>, items: [T]) {
        self.header = original.header
        self.items = items
    }

    public var identity: String {
        return header ?? ""
    }

}

// SwiftLint for force_cast will be disabled because we are sure that we can cast items to [T]
// swiftlint:disable force_cast
public extension Observable {

    func mapToSection<T>() -> Observable<[Section<T>]> {
        return map { [Section<T>(items: $0 as! [T])] }
    }

    func mapToAnimatableSection<T>() -> Observable<[AnimatableSection<T>]> {
        return map { [AnimatableSection<T>(items: $0 as! [T])] }
    }

}
