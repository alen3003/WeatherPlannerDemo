import XCTest
import Nimble

class WeatherPlannerDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNavigationBarTitle() throws {

        let app = XCUIApplication()
        let navigationBarTitle = app.navigationBars["Weather Planner"].staticTexts["Weather Planner"]

        expect(navigationBarTitle.exists).to(beTrue())
    }

}
