//
//  Side_Menu_Test_2App.swift
//  Side Menu Test 2
//
//  Created by Victor Han on 2022/7/28.
//

import SwiftUI

@main
struct Side_Menu_Test_2App: App {
    @StateObject var appInfo = AppInformation()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(appInfo)
        }
    }
}
