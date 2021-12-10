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

        return waitFor(predicateString: "isHittable == true", timeout: timeout) == .completed
    }

    /// Uses the given `String` to create an `NSPredicate` and waits for it to be true on `self` for
    /// the given `timeout` (defaults to 3 seconds)
    @discardableResult
    public func waitFor(predicateString: String, timeout: TimeInterval = 3.0) -> XCTWaiter.Result {
        waitFor(predicate: NSPredicate(format: predicateString), timeout: timeout)
    }

    /// Waits for the given `NSPredicate` to be true on `self` for the given `timeout` (default to
    /// 3 seconds)
    @discardableResult
    public func waitFor(predicate: NSPredicate, timeout: TimeInterval = 3.0) -> XCTWaiter.Result {
        XCTWaiter.wait(
            for: [ XCTNSPredicateExpectation(predicate: predicate, object: self) ],
            timeout: timeout
        )
    }
}
