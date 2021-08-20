import XCTest

extension XCUIElement {

    /// Waits for `self` to be hittable (for `isHittable` to be `true`) for the given `timeout`,
    /// returning `true` if the wait was successful and `false` otherwise
    ///
    /// Beware that this uses `XCTNSPredicateExpectation` which relies on polling and is slower
    /// that other asynchronous expectations.
    @discardableResult
    public func waitForIsHittable(timeout: TimeInterval = 3.0) -> Bool {
        // Avoid unnecessary waiting if the element is already hittable
        guard isHittable == false else { return true }

        let result = XCTWaiter.wait(
            for: [
                XCTNSPredicateExpectation(
                    predicate: NSPredicate(format: "isHittable == true"),
                    object: self
                )
            ],
            timeout: timeout
        )

        return result == .completed
    }
}
