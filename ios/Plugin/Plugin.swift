import Capacitor
import Foundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(DetectEnvironment)
public class DetectEnvironment: CAPPlugin {
    @objc func isDebug(_ call: CAPPluginCall) {
        call.success([
            "value": Env.isDebug(),
        ])
    }

    @objc func isTestFlight(_ call: CAPPluginCall) {
        call.success([
            "value": Env.isTestFlight(),
        ])
    }

    @objc func isAdHoc(_ call: CAPPluginCall) {
        call.success([
            "value": Env.isAdHoc(),
        ])
    }

    @objc func isSimulator(_ call: CAPPluginCall) {
        call.success([
            "value": Env.isSimulator(),
        ])
    }

    @objc func isAppStore(_ call: CAPPluginCall) {
        call.success([
            "value": Env.isAppStore(),
        ])
    }

    @objc func isSandbox(_ call: CAPPluginCall) {
        call.success([
            "value": Env.isSandbox(),
        ])
    }
}

enum Env {
    static func isDebug() -> Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }

    static func isAdHoc() -> Bool {
        #if ADHOC
            return true
        #else
            return false
        #endif
    }

    static func isTestFlight() -> Bool {
        if isSimulator() {
            return false
        } else {
            if isSandbox(), !hasEmbeddedMobileProvision() {
                return true
            } else {
                return false
            }
        }
    }

    static func isSimulator() -> Bool {
        #if arch(i386) || arch(x86_64)
            return true
        #else
            return false
        #endif
    }

    static func isAppStore() -> Bool {
        if isSimulator() {
            return false
        } else {
            if isSandbox() || hasEmbeddedMobileProvision() {
                return false
            } else {
                return true
            }
        }
    }

    static func isSandbox() -> Bool {
        if isSimulator() {
            return false
        } else {
            if Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" {
                return true
            }
            return false
        }
    }

    private static func hasEmbeddedMobileProvision() -> Bool {
        if let _ = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") {
            return true
        }
        return false
    }
}
