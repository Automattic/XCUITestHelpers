import XCTest

extension XCUIApplication {

    /// Helper function to hit the status bar that falls back to hitting the system's status bar
    /// if the app has none.
    func tapStatusBar() {
        let statusBar = statusBars.firstMatch

        guard statusBar.exists else {
            // As of iOS 13.0, the status bar is part of Springboard, not the app itself. As such,
            // we need to tap it from Springboard.
            //
            // This framework targets iOS 13 and above. So we don't need a fallback for previous
            // versions.
            //
            // Credits https://alloc-init.com/blog/2019.08.08
            let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")

            // Springboard might return more than one status bar here (?!), so let's iterate on the
            // results till we find one that can be hit.
            springboard.statusBars.allElementsBoundByIndex.filter { $0.isHittable }.first?.tap()

            return
        }

        statusBar.tap()
    }
}
