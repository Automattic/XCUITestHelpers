import XCTest
@testable import XCUITestHelpers

final class XCUITestHelpersTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XCUITestHelpers().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
