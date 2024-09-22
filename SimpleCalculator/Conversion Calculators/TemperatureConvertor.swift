//
//  TemperatureConvertor.swift
//  SwiftlyConvert
//
//  Created by Akshat Srivastava on 13/08/24.
//

import SwiftUI

struct TemperatureConvertor: View {
    
    @State private var input: String = ""
    @State private var fromTemperature = "Celsius"
    @State private var toTemperature: String = ""
    @State private var convertedTemp = ""
    
    let fromTemperatureOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    let toTemperatureOptions = ["Select an option", "Fahrenheit","Celsius", "Kelvin"]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("From")
                            .foregroundStyle(.colorSet1)
                        
                        TextField("Ex: 100", text: $input)
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                            .foregroundStyle(.colorSet1)
                        
                        Spacer()
                        
                        Picker("Select Option", selection: $fromTemperature){
                            ForEach(fromTemperatureOptions, id: \.self) {
                                option in
                                Text(option)
                            }
                        }
                        .onChange(of: toTemperature) { oldValue, newValue in
                            if !newValue.isEmpty && !input.isEmpty {
                                convertedTemp = String(format: "%.2f", (temperatureConvertor(temp: Double(input) ?? 0, convertFrom: fromTemperature, convertTo: toTemperature)))
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("To")
                            .foregroundStyle(.colorSet1)
                        
                        
                        Picker("Select Option", selection: $toTemperature){
                            ForEach(toTemperatureOptions, id: \.self) {
                                option in
                                Text(option)
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                    HStack{
                        Button (action:{
                            
                            convertedTemp = String(format: "%.2f", (temperatureConvertor(temp: Double(input) ?? 0, convertFrom: fromTemperature, convertTo: toTemperature)))
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 170, height: 50)
                                    .foregroundStyle(.colorSet1)
                                
                                Text("Convert")
                                    .foregroundStyle(.colorSet2)
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                            }
                        })
                        
                        Spacer()
                        
                        Button (action:{
                            
                            input = ""
                            fromTemperature = "Celsius"
                            toTemperature = ""
                            convertedTemp = ""
                            
                        }, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: 170, height: 50)
                                    .foregroundStyle(.gray)
                                
                                Text("Reset")
                                    .foregroundStyle(.colorSet2)
                                    .font(.system(size: 25))
                                    .fontWeight(.semibold)
                            }
                        })
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    VStack{
                        
                        
                        
                        if toTemperature == "Celsius" {
                            Text("\(convertedTemp) °C")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toTemperature == "Fahrenheit" {
                            Text("\(convertedTemp) °F")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toTemperature == "Kelvin" {
                            Text("\(convertedTemp) K")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else {
                            Text("Select a target unit and press Convert")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        
                    }
                    .padding()
                    
                    
                    .navigationTitle("Temperature Convertor")
                    .foregroundStyle(.colorSet1)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

func temperatureConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "Celsius" && convertTo == "Fahrenheit"{
        result = (temp * 9/5) + 32
    }
    
    else if convertFrom == "Celsius" && convertTo == "Kelvin"{
        result = temp + 273.15
    }
    
    else if convertFrom == "Fahrenheit" && convertTo == "Celsius"{
        result = (temp - 32) * 5/9
    }
    
    else if convertFrom == "Fahrenheit" && convertTo == "Kelvin"{
        result = (temp - 32) * 5/9 + 273.15
    }
    
    else if convertFrom == "Kelvin" && convertTo == "Celsius"{
        result = temp - 273.15
    }
    
    else if convertFrom == "Kelvin" && convertTo == "Fahrenheit"{
        result = (temp - 273.15) * 9/5 + 32
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    TemperatureConvertor()
}
