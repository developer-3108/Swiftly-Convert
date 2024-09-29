
import SwiftUI

struct SettingsPage: View {
    
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var destinationConfirmation = false
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack{
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.fontColor1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        VStack (spacing: 20){
                            HStack{
                                Image("brush")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                
                                Text("App Color")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Spacer()
                                                                    
                            }
                            .padding(.horizontal)
                
                                HStack {
                                    ForEach(ColorOption.allCases, id: \.self) { option in
                                        Button{
                                            colorThemeManager.setColor(option.rawValue)
                                        } label: {
                                            Image(systemName: "circle.fill")
                                                .font(.title)
                                                .foregroundStyle(option.color)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                        }
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.fontColor1.opacity(0.1))
                                .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                        )
                        
                        VStack {
                            HStack{
                                Image("branch")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                
                                Text("Version")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Spacer()
                                 
                                Text("v2.0.0")
                            }
                            .padding(.horizontal)
                        }
                        .padding(.vertical)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.fontColor1.opacity(0.1))
                                .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                        )
                        
                        NavigationLink(destination: AboutDeveloperPage(), isActive: $destinationConfirmation) {
                            
                            HStack{
                                Image("code")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                
                                Text("About Developer")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                                Button {
                                    destinationConfirmation = true
                                } label: {
                                    Image(systemName: "arrow.right.circle.fill")
                                        .foregroundStyle(.fontColor1)
                                        .font(.largeTitle)
                                }
                                
                            }
                                .padding(.vertical)
                                .padding(.horizontal)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.fontColor1.opacity(0.1))
                                        .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                                )
                        }
                        
                        Link(destination: URL(string: "https://forms.gle/YiQzfS3cs2o34dWr9")!) {
                           
                            HStack{
                                Image("feedback")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                
                                Text("Share Your Feedback")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                
                                Spacer()
                                
                                Image(systemName: "arrow.right.circle.fill")
                                    .foregroundStyle(.fontColor1)
                                    .font(.largeTitle)
                            }
                            .padding(.horizontal)
                            .padding(.vertical)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.fontColor1.opacity(0.1))
                                .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                        )
                    }
                    .vTop()
                }
                .padding(.horizontal)
            }
            
        }
        .tint(.fontColor1)
    }
}

#Preview {
    SettingsPage()
        .environmentObject(ColorThemeManager())
}
