import SwiftUI

struct DemoPageTest: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    var body: some View {
        ZStack{
            LinearGradient(colors: colorThemeManager.gradientColors(),
                           startPoint: .topTrailing,
                           endPoint: .bottom)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    DemoPageTest()
        .environmentObject(ColorThemeManager())
}
