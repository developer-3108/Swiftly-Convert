//
//  IntroPage.swift
//  SwiftlyConvert
//
//  Created by Akshat Srivastava on 13/08/24.
//

import SwiftUI

struct IntroPage: View {
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 30, style: .circular)
                        .fill(.colorSet1)
                        .frame(width: 150, height: 150)
                    Image(systemName: "plus.slash.minus")
                        .foregroundStyle(.colorSet2)
                        .font(.system(size: 70))
                        .fontWeight(.heavy)
                }
                
                Text("Swiftly \n Convert")
                    .fontWeight(.medium)
                    .foregroundStyle(.colorSet1)
                    .font(.system(size: 70))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
            }
            Spacer()
            
            NavigationLink(destination: HomePage(), label: {
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .frame(width: 350, height: 100)
                    .foregroundStyle(.colorSet1)
                    .overlay {
                        HStack{
                            Text("Start")
                                .foregroundStyle(.colorSet2)
                                .font(.system(size: 50))
                            
                            Spacer()
                            
                            Image(systemName: "arrow.forward")
                                .foregroundStyle(.colorSet2)
                                .font(.system(size: 45))
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
            })
            .padding(.top, 150)
            
        }
    }
}

#Preview {
    IntroPage()
}
