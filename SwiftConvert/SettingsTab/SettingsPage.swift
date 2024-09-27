//
//  SettingsPage.swift
//  SwiftConvert
//
//  Created by Akshat Srivastava on 24/09/24.
//

import SwiftUI

struct SettingsPage: View {
    
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    
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
                        
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(.fontColor1.opacity(0.2))
                                .frame(height: 150)
                                .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                                .overlay(
                                    VStack {
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
                                    
                                )
                    }
                    .vTop()
                }
                .padding(.horizontal)
            }
            
        }
    }
}

#Preview {
    SettingsPage()
        .environmentObject(ColorThemeManager()) 
}
