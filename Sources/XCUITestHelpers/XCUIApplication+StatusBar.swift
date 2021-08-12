import XCTest

extension XCUIApplication {

    func tapStatusBar() {
        let statusBar = statusBars.firstMatch

        guard statusBar.exists else {
            // If for some reason there's no status bar even thought the code expects one, use this
            // workaround: tap the appropriate spot on the navigation bar.
            return navigationBars
                .allElementsBoundByIndex
                .map { $0.coordinate(withNormalizedOffset: CGVector(dx: 20, dy: -20)) }
                .forEach { $0.tap() }
        }

        statusBar.tap()
    }
}
