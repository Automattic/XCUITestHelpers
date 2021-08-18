import XCUITestHelpers
import XCTest

class XCUIElementQueryPositionTests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testElementsShareCommonAxisX() {
        let labelContains: (String) -> NSPredicate = { string in
            return NSPredicate { object, _ in
                // `XCUIElementAttributes` is the type of object received by the predicate at
                // runtime as per the docs, but this `NSPredicate` syntax defines the input as
                // `Any?` so we need to explicitly cast it.
                guard let attributes = object as? XCUIElementAttributes else { return false }

                return attributes.label.contains(string)
            }
        }

        // We have a view with a 3x3 matrix with `Text` elements with content "xn-ym", where n is
        // the index on the x axis and m the index on the y axis.
        //
        // All elements containing "xn-" should be on the same x axis
        XCTAssertTrue(app.staticTexts.matching(labelContains("x1-")).allElementsShareCommonAxisX)
        XCTAssertTrue(app.staticTexts.matching(labelContains("x2-")).allElementsShareCommonAxisX)
        // All elements containing "-ym" should be on the same y axis, therefore not on the same x
        // axis
        XCTAssertFalse(app.staticTexts.matching(labelContains("-y1")).allElementsShareCommonAxisX)
        XCTAssertFalse(app.staticTexts.matching(labelContains("-y2")).allElementsShareCommonAxisX)
    }
}
