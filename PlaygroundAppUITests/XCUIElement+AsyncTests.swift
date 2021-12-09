import XCUITestHelpers
import XCTest

class XCUIElementAsyncTests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testWaitsForPredicateOnElement() {
        XCTAssertEqual(
            app.staticTexts["a"].waitFor(
                predicate: NSPredicate(format: "isEnabled == true"),
                timeout: 2 // Interestingly, on Xcode 13.1, a 1 second timeout results in a failure
            ),
            .completed
        )
        // Test the opposite scenario must also be true.
        XCTAssertEqual(
            app.staticTexts["a"].waitFor(
                predicate: NSPredicate(format: "isEnabled == false"),
                timeout: 2
            ),
            .timedOut
        )
    }

    func testWaitsForPredicateFromStringOnElement() {
        XCTAssertEqual(
            app.staticTexts["a"].waitFor(predicateString: "isEnabled == true"),
            .completed
        )
        // Test the opposite scenario must also be true.
        XCTAssertEqual(
            app.staticTexts["a"].waitFor(predicateString: "isEnabled == false"),
            .timedOut
        )
    }
}
