// Important: don't use @testable here because we want to make sure we're testing the framework
// in the same way a real world user would consume it. That is, without access to the `internal`
// methods.
import XCUITestHelpers
import XCTest

class PlaygroundAppUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["button has not been tapped"].exists)
        XCTAssertFalse(app.staticTexts["button was tapped"].exists)

        // This verifies the XCUIElementQuery+Sequence extension works
        app.staticTexts.forEach {
            XCTAssertNotNil($0.value as? String)
        }

        let button = app.buttons["button"]
        // This is a shallow test... To make it actually verify asynchronous behavior, we should
        // make the button start as interactive and update after a few moments.
        XCTAssertTrue(button.waitForIsHittable())

        button.tap()

        XCTAssertFalse(app.staticTexts["button has not been tapped"].exists)
        XCTAssertTrue(app.staticTexts["button was tapped"].exists)
    }
}
