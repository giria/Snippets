//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

@main
struct SnippetsApp: App {
    @Environment(\.scenePhase) private var scenePhase
    @AppStorage("openAppCount") private var openAppCount = 0
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            if phase == .active {
                // App opened
                // update the counter
                openAppCount += 1
                print(openAppCount)
            }
        }
    }
}
