import UIKit
import Flutter
import SomeApp
//import UseCaseKit
import SnapKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
//        print(Hoge.fuga)
//        print(App.text)
        print(SnapKit.Constraint.self)
        let app = SomeApp()
        print(app.text)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

//enum Hoge: Command {
//    typealias State = String
//
//    case fuga
//}
