import UIKit
import XCTest

public extension XCUIDevice {

    /// The device `UIUserInterfaceIdiom`.
    ///
    /// This is declared as `static` rather than at the instance level to make it easier to call.
    /// The UI tests thread can't run on multiple devices at the same time, so there is no strict
    /// need to read this value from an instance.
    static var userInterfaceIdiom: UIUserInterfaceIdiom {
        UIDevice.current.userInterfaceIdiom
    }

    /// Whether the device is an iPhone or an iPhone Simulator.
    ///
    /// This is declared as `static` rather than at the instance level to make it easier to call.
    /// The UI tests thread can't run on multiple devices at the same time, so there is no strict
    /// need to read this value from an instance.
    static var isPhone: Bool {
        userInterfaceIdiom == .phone
    }

    /// Whether the device is an iPad or an iPad Simulator.
    ///
    /// This is declared as `static` rather than at the instance level to make it easier to call.
    /// The UI tests thread can't run on multiple devices at the same time, so there is no strict
    /// need to read this value from an instance.
    static var isPad: Bool {
        userInterfaceIdiom == .pad
    }
}
