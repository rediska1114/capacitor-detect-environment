import Foundation

@objc public class DetectEnvironment: NSObject {
    @objc public func isDebug() -> Bool {
        #if DEBUG
            return true
        #else
            return false
        #endif
    }

    @objc public func isAdHoc() -> Bool {
        #if ADHOC
            return true
        #else
            return false
        #endif
    }

    @objc public func isTestFlight() -> Bool {
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

    @objc public func isSimulator() -> Bool {
        #if arch(i386) || arch(x86_64)
            return true
        #else
            return false
        #endif
    }

    @objc public func isAppStore() -> Bool {
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

    @objc public func isSandbox() -> Bool {
        if isSimulator() {
            return false
        } else {
            if Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt" {
                return true
            }
            return false
        }
    }

    @objc private func hasEmbeddedMobileProvision() -> Bool {
        if let _ = Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") {
            return true
        }
        return false
    }
}
