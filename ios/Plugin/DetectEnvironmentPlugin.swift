import Capacitor
import Foundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(DetectEnvironmentPlugin)
public class DetectEnvironmentPlugin: CAPPlugin {
    private let implementation = DetectEnvironment()

    @objc func isDebug(_ call: CAPPluginCall) {
        call.resolve([
            "value": implementation.isDebug(),
        ])
    }

    @objc func isTestFlight(_ call: CAPPluginCall) {
        call.resolve([
            "value": implementation.isTestFlight(),
        ])
    }

    @objc func isAdHoc(_ call: CAPPluginCall) {
        call.resolve([
            "value": implementation.isAdHoc(),
        ])
    }

    @objc func isSimulator(_ call: CAPPluginCall) {
        call.resolve([
            "value": implementation.isSimulator(),
        ])
    }

    @objc func isAppStore(_ call: CAPPluginCall) {
        call.resolve([
            "value": implementation.isAppStore(),
        ])
    }

    @objc func isSandbox(_ call: CAPPluginCall) {
        call.resolve([
            "value": implementation.isSandbox(),
        ])
    }
}
