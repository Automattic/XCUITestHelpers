import XCTest

public extension XCUIElement {

    func isFullyVisibleOnScreen(in app: XCUIApplication = XCUIApplication()) -> Bool {
        guard exists && frame.isEmpty == false && isHittable else { return false }

        return app.windows.element(boundBy: 0).frame.contains(frame)
    }
}
