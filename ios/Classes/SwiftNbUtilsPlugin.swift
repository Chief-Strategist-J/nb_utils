import Flutter
import UIKit

public class SwiftNbUtilsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "nb_utils", binaryMessenger: registrar.messenger())
    let instance = SwiftNbUtilsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //result("iOS " + UIDevice.current.systemVersion)

    if(call.method == "packageInfo") {
        self.packInfo = ["packageName": Bundle.main.bundleIdentifier!,"versionCode": Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String, "versionName": Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String];
        result(self.packInfo);
    } else {
        result("")
    }
  }
}
