

import SwiftUI

struct AboutDeveloperPage: View {
    
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack{
                    Text("About Developer")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.fontColor1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 20){
            
                            VStack{
                                Text("About Me")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Hello I'm Akshat Srivastava. The developer of Swiftly Convert App. I'm a passionate iOS and macOS developer currently studying Computer Science. I have a keen interest in creating intuitive, user-friendly applications that makes everyday tasks easier for users. With Swift and SwiftUI as my primary tools. I strive to deliever apps that are both functional and beautiful.")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 1)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.fontColor1.opacity(0.1))
                                    .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                            )
                            
                            VStack {
                                Text("Why I Built Swiftly Convert")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("Swiftly Convert was born out of the need for a simple, clean and reliable unit conversion app which should be ad free and also available free of cost without any subscriptions. I wanted to create a tool that users could rely on for daily tasks - whether it's converting measurements, calculate interest, or dealing with data-related conversions. My goal was to provide hassle-free experience with all key conversions in one app.")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 1)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.fontColor1.opacity(0.1))
                                    .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                            )
                            
                            VStack {
                                Text("Future Plans")
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("In the future, I plan to expand the features of Swiftly Convert with more app conversion options, enhanced UI themes, and perhaps integration with cloud services for data backup. Stay tuned for more updates!\n\nThanks for using Swiftly Convert, and I hope you find it helpful in your daily tasks! You can connect with me on LinkedIn, X (formaly Twitter), Threads, or GitHub for more information.")
                                    .font(.title3)
                                    .fontWeight(.regular)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .multilineTextAlignment(.leading)
                                    .padding(.top, 1)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundStyle(.fontColor1.opacity(0.1))
                                    .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                            )
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.fontColor1.opacity(0.1))
                                .frame(height: 100)
                                .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                                .overlay(
                                    Link(destination: URL(string: "https://www.linkedin.com/in/akshat-srivastava07/")!) {
                                        HStack{
                                            Image("linkedin")
                                                .resizable()
                                                .frame(width: 60, height: 60)
                                            
                                            Text("LinkedIn")
                                                .foregroundStyle(.fontColor1)
                                                .font(.title2)
                                                .fontWeight(.medium)
                                            
                                            Spacer()
                                            
                                            Image(systemName: "arrow.right.circle.fill")
                                                .foregroundStyle(.fontColor1)
                                                .font(.largeTitle)
                                        }
                                        .padding(.horizontal)
                                    }
                                )
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.fontColor1.opacity(0.1))
                            .frame(height: 100)
                            .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                            .overlay(
                                Link(destination: URL(string: "https://x.com/developer_3108")!) {
                                    HStack{
                                        Image("twitter")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                        
                                        Text("X")
                                            .foregroundStyle(.fontColor1)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.right.circle.fill")
                                            .foregroundStyle(.fontColor1)
                                            .font(.largeTitle)
                                    }
                                    .padding(.horizontal)
                                }
                            )
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.fontColor1.opacity(0.1))
                            .frame(height: 100)
                            .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                            .overlay(
                                Link(destination: URL(string: "https://www.threads.net/@developer_3108")!) {
                                    HStack{
                                        Image("threads")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                        
                                        Text("Threads")
                                            .foregroundStyle(.fontColor1)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.right.circle.fill")
                                            .foregroundStyle(.fontColor1)
                                            .font(.largeTitle)
                                    }
                                    .padding(.horizontal)
                                }
                            )
                        
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundStyle(.fontColor1.opacity(0.1))
                            .frame(height: 100)
                            .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                            .overlay(
                                Link(destination: URL(string: "https://github.com/developer-3108")!) {
                                    HStack{
                                        Image("github")
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                        
                                        Text("GitHub")
                                            .foregroundStyle(.fontColor1)
                                            .font(.title2)
                                            .fontWeight(.medium)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "arrow.right.circle.fill")
                                            .foregroundStyle(.fontColor1)
                                            .font(.largeTitle)
                                    }
                                    .padding(.horizontal)
                                }
                            )
                        }
                        
                        VStack {
                            HStack {
                                Text("Made with")
                                Image(systemName: "heart.fill")
                            }
                            .fontWeight(.medium)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.title3)
                            
                            Text("For you & me")
                                .fontWeight(.bold)
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .foregroundStyle(Color.gray)
                        .padding(.top)
                    }
                    
                }
                .padding(.horizontal)
                .vTop()
                
            }
            
            
        }
    }
}

#Preview {
    AboutDeveloperPage()
        .environmentObject(ColorThemeManager())
}
