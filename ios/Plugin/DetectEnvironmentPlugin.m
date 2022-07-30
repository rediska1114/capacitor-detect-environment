#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(DetectEnvironmentPlugin, "DetectEnvironment",
            CAP_PLUGIN_METHOD(isDebug, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(isTestFlight, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(isAdHoc, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(isSimulator, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(isAppStore, CAPPluginReturnPromise);
            CAP_PLUGIN_METHOD(isSandbox, CAPPluginReturnPromise);
)
