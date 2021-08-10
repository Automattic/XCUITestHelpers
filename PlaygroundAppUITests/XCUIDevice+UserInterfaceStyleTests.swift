import XCUITestHelpers
import XCTest

class XCUIDeviceUserInterfaceStyleTests: XCTestCase {

    func testReadingUserInterfaceStyleReturnsConsistentValues() {
        // We can't control the device appearance mode (light vs dark) from the tests, so we just
        // check the method returns consistent results
        XCTAssertNotEqual(XCUIDevice.userInterfaceStyle, .unspecified)
        XCTAssertNotEqual(XCUIDevice.inDarkMode, XCUIDevice.inLightMode)
    }
}
