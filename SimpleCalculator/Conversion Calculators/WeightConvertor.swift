//
//  TemperatureConvertor.swift
//  SwiftlyConvert
//
//  Created by Akshat Srivastava on 13/08/24.
//

import SwiftUI

struct WeightConvertor: View {
    
    @State private var input: String = ""
    @State private var fromWeight = "Tons (t)"
    @State private var toWeight: String = ""
    @State private var convertedWeight = ""
    
    let fromWeightOptions = ["Tons (t)", "Pounds (lb)", "Grams (g)", "Kilograms (kg)"]
    let toWeightOptions = ["Select an option", "Tons (t)", "Pounds (lb)", "Grams (g)", "Kilograms (kg)"]
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical){
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
                        
                        Picker("Select Option", selection: $fromWeight){
                            ForEach(fromWeightOptions, id: \.self) {
                                option in
                                Text(option)
                            }
                        }
                        .onChange(of: fromWeight) { _ in
                            if !toWeight.isEmpty && !input.isEmpty {
                                convertedWeight = String(format: "%.7f", (weightConvertor(temp: Double(input) ?? 0, convertFrom: fromWeight, convertTo: toWeight)))
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("To")
                            .foregroundStyle(.colorSet1)
                        
                        
                        Picker("Select Option", selection: $toWeight){
                            ForEach(toWeightOptions, id: \.self) {
                                option in
                                Text(option)
                            }
                        }
                        .onChange(of: toWeight) { _ in
                            if !toWeight.isEmpty && !input.isEmpty {
                                convertedWeight = String(format: "%.7f", (weightConvertor(temp: Double(input) ?? 0, convertFrom: fromWeight, convertTo: toWeight)))
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                    HStack{
                        Button (action:{
                            
                            convertedWeight = String(format: "%.7f", (weightConvertor(temp: Double(input) ?? 0, convertFrom: fromWeight, convertTo: toWeight)))
                            
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
                            fromWeight = "Tons (t)"
                            toWeight = ""
                            convertedWeight = ""
                            
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
                        
                        
                        
                        if toWeight == "Tons (t)" {
                            Text("\(convertedWeight) t")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toWeight == "Pounds (lb)" {
                            Text("\(convertedWeight) lb")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toWeight == "Grams (g)" {
                            Text("\(convertedWeight) g")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toWeight == "Kilograms (kg)" {
                            Text("\(convertedWeight) kg")
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
                    
                    
                    .navigationTitle("Weight Convertor")
                    .foregroundStyle(.colorSet1)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

func weightConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "Tons (t)" && convertTo == "Pounds (lb)"{
        result = temp * 2000
    }
    
    else if convertFrom == "Tons (t)" && convertTo == "Grams (g)"{
        result = temp * 1000000
    }
    
    else if convertFrom == "Tons (t)" && convertTo == "Kilograms (kg)"{
        result = temp * 1000
    }
    
    else if convertFrom == "Pounds (lb)" && convertTo == "Tons (t)"{
        result = temp / 2000
    }
    
    else if convertFrom == "Pounds (lb)" && convertTo == "Grams (g)"{
        result = temp * 453.6
    }
    
    else if convertFrom == "Pounds (lb)" && convertTo == "Kilograms (kg)"{
        result = temp / 2.205
    }
    
    else if convertFrom == "Grams (g)" && convertTo == "Tons (t)"{
        result = temp / 907200
    }
    
    else if convertFrom == "Grams (g)" && convertTo == "Pounds (lb)"{
        result = temp / 453.6
    }
    
    else if convertFrom == "Grams (g)" && convertTo == "Kilograms (kg)"{
        result = temp / 1000
    }
    
    else if convertFrom == "Kilograms (kg)" && convertTo == "Tons (t)"{
        result = temp / 907.2
    }
    
    else if convertFrom == "Kilograms (kg)" && convertTo == "Pounds (lb)"{
        result = temp * 2.205
    }
    
    else if convertFrom == "Kilograms (kg)" && convertTo == "Grams (g)"{
        result = temp * 1000
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    WeightConvertor()
}
