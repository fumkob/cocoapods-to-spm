//
//  WatchApp.swift
//  Watch Watch App
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import SwiftUI
import WatchView

@main
struct Watch_Watch_AppApp: App {
    @WKApplicationDelegateAdaptor var appDelegate: WKAppDelegate
    var body: some Scene {
        WindowGroup {
            RootView(resolver: appDelegate.container)
        }
    }
}
