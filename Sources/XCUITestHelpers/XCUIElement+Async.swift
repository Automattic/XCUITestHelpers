import XCTest

extension XCUIElement {

    /// Beware that this uses `XCTNSPredicateExpectation` which relies on polling and is slower than
    /// other asynchronous expectations.
    @discardableResult
    public func waitForIsHittable(timeout: TimeInterval = 3.0) -> Bool {
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
