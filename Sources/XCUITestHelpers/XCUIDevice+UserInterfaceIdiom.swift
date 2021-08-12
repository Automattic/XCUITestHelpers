import UIKit
import XCTest

public extension XCUIDevice {

    static var userInterfaceIdiom: UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }

    static var isPhone: Bool {
        userInterfaceIdiom == .phone
    }

    static var isPad: Bool {
        userInterfaceIdiom == .pad
    }
}
