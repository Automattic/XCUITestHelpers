import XCUITestHelpers
import XCTest

class XCUIDeviceUserInterfaceIdiomTests: XCTestCase {

    func testUserInterfaceIdiom() {
        // To keep this test flexible, let's just verify the result we're getting is consistent.
        // If `XCUIDevice` tells us it's a phone then is should not be a pad, and vice versa.
        XCTAssertNotEqual(XCUIDevice.userInterfaceIdiom, .unspecified)
        XCTAssertNotEqual(XCUIDevice.isPhone, XCUIDevice.isPad)
    }
}

