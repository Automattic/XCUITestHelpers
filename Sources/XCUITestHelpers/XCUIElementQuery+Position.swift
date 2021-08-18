import XCTest

extension XCUIElementQuery {

    /// Whether all elements in the query are aligned over the x axis.
    public var allElementsShareCommonAxisX: Bool {
        let elementsXPositions = allElementsBoundByIndex.map { $0.frame.minX }

        // Use a set to remove duplicates – if all elements are the same, only one should remain.
        return Set(elementsXPositions).count == 1
    }
}
