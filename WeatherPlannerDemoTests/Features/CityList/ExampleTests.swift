import XCTest

class ExampleTests: XCTestCase {

    struct OperationManager {

        let x: Int
        let y: Int

        func multiply() -> Int {
            x * y
        }

    }

    var x: Int!
    var y: Int!
    var manager: OperationManager!

    override func setUp() {
        x = 10
        y = 5
        manager = OperationManager(x: x, y: y)
    }

    override func tearDown() {
        x = nil
        y = nil
        manager = nil
    }

    func testMultiplication() {
        XCTAssertEqual(manager.multiply(), 50, "Multiplication result does not match the expected value of 50")
    }

}
