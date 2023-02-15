//
//  WKAppDelegate.swift
//  Watch App
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import WatchKit
import Swinject
import Infra
import UseCase

class WKAppDelegate: NSObject, WKApplicationDelegate {

    let container = Container()

    func applicationDidFinishLaunching() {
        container.register(LocalStorage.self) { _ in
            LocalUserDefaults(userDefaults: UserDefaults.standard)
        }
    }
}
