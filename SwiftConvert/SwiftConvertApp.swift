import SwiftUI

@main
struct SwiftConvertApp: App {
    @StateObject private var colorThemeManager = ColorThemeManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(colorThemeManager)
        }
    }
}
