import XCTest
import Nimble

class WeatherPlannerDemoUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {}

    func testNavigationBarTitle() {
        let app = XCUIApplication()
        let navigationBarTitle = app.navigationBars["Weather Planner"].staticTexts["Weather Planner"]

        expect(navigationBarTitle.exists).to(beTrue())
    }

}
