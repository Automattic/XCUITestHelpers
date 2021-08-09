import UIKit
import XCTest

public extension XCUIDevice {

    /// The device `UIUserInterfaceStyle`.
    ///
    /// This is declared as `static` rather than at the instance level to make it easier to call.
    /// The UI tests thread can't run on multiple devices at the same time, so there is no strict
    /// need to read this value from an instance.
    static var userInterfaceStyle: UIUserInterfaceStyle {
        UIViewController().traitCollection.userInterfaceStyle
    }

    /// Whether the device is in dark mode
    ///
    /// This is declared as `static` rather than at the instance level to make it easier to call.
    /// The UI tests thread can't run on multiple devices at the same time, so there is no strict
    /// need to read this value from an instance.
    static var inDarkMode: Bool {
        userInterfaceStyle == .dark
    }

    /// Whether the device is in dark mode
    ///
    /// This is declared as `static` rather than at the instance level to make it easier to call.
    /// The UI tests thread can't run on multiple devices at the same time, so there is no strict
    /// need to read this value from an instance.
    static var inLightMode: Bool {
        userInterfaceStyle == .light
    }
}
