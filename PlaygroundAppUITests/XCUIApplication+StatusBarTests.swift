import XCUITestHelpers
import XCTest

class XCUIApplicationStatusBarTests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testTapStatusBar() throws {
        let getFirstListElement = { self.app.staticTexts["a"].firstMatch }
        let getLastListElement = { self.app.staticTexts["z"].firstMatch }

        // Ensure the list is in the default initial position by checking that the first element is
        // hittable and the last isn't (meaning it's offscreen).
        XCTAssertTrue(getFirstListElement().isHittable)
        XCTAssertFalse(getLastListElement().isHittable)

        var attempts = 0
        let attemptsThreshold = 5
        while getLastListElement().isHittable == false && attempts < attemptsThreshold {
            app.swipeUp()
            attempts += 1
        }

        // The while loop above ensures that the scroll occurred by verifying the last list element
        // has become hittable (is now on screen). Let's double-check it by asserting the first
        // element is no longer hittable
        XCTAssertFalse(getFirstListElement().isHittable)
        XCTAssertTrue(getLastListElement().isHittable)

        app.tapStatusBar()

        // Let's now verify the tap on the status bar was successful by mean of checking that the
        // list returned to the initial position.
        //
        // We use `waitForIsHittable` here to give time to the scroll to finish.
        XCTAssertTrue(getFirstListElement().waitForIsHittable())
        XCTAssertFalse(getLastListElement().isHittable)
    }
}
