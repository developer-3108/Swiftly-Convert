//
//  HomePage.swift
//  SwiftlyConvert
//
//  Created by Akshat Srivastava on 13/08/24.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
         NavigationStack{
            ScrollView(.vertical) {
                VStack(alignment: .leading){
                    Text("Banking\nCalculators")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.leading)
                        .foregroundStyle(.colorSet1)
                    
                    HStack{
                        Spacer()
                                NavigationLink(destination: SimpleInterestCalculator()) {
                                    VStack {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 30)
                                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                                .foregroundStyle(.green)
                                            
                                            Image(systemName: "plus.forwardslash.minus")
                                                .foregroundStyle(.white)
                                                .font(.system(size: 40))
                                                .fontWeight(.bold)
                                        }
                                        
                                        Text("Simple Interest\nCalculator")
                                            .foregroundStyle(.colorSet1)
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: 20))
                                        
                                    }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: CompountInterestCalculator()) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .foregroundStyle(.yellow)
                                    
                                    Image(systemName: "multiply")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                }
                                
                                Text("Compound Interest\nCalculator")
                                    .foregroundStyle(.colorSet1)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20))
                                
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Text("Conversion Calculators")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding(.leading)
                    
                    HStack{
                        Spacer()

                        NavigationLink(destination: TemperatureConvertor()) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .foregroundStyle(.pink)
                                    
                                    Image(systemName: "thermometer.transmission")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                }
                                
                                Text("Temperature\nConvertor")
                                    .foregroundStyle(.colorSet1)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20))
                                
                            }
                }
                
                Spacer()
                
                NavigationLink(destination: LengthConvertor()) {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .foregroundStyle(.cyan)
                            
                            Image(systemName: "multiply")
                                .foregroundStyle(.white)
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                        }
                        
                        Text("Length\nConvertor")
                            .foregroundStyle(.colorSet1)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20))
                        
                    }
                    
        }
                        Spacer()
                        
                        NavigationLink(destination: WeightConvertor()) {
                            VStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                                    .foregroundStyle(.purple)
                                    
                                    Image(systemName: "scalemass")
                                        .foregroundStyle(.white)
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                }
                                
                                Text("Weight\nConvertor")
                                    .foregroundStyle(.colorSet1)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20))
                                
                            }
                            
                }
                        Spacer()
                
                    }
                    .padding()
                    
                }
            }
        }
    }
}


#Preview {
    HomePage()
}
