// Important: don't use @testable here because we want to make sure we're testing the framework
// in the same way a real world user would consume it. That is, without access to the `internal`
// methods.
import UITestsHelpers
import XCTest

class PlaygroundAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts[UITestsHelpers().text].exists)

        // This verifies the XCUIElementQuery+Sequence extension works
        app.staticTexts.forEach {
            XCTAssertNotNil($0.value as? String)
        }
    }
}
