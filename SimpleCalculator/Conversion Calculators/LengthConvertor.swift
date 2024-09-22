//
//  TemperatureConvertor.swift
//  SwiftlyConvert
//
//  Created by Akshat Srivastava on 13/08/24.
//

import SwiftUI

struct LengthConvertor: View {
    
    @State private var input: String = ""
    @State private var fromLength = "Millimeter (mm)"
    @State private var toLength: String = ""
    @State private var convertedLength = ""
    
    let fromLengthOptions = ["Millimeter (mm)", "Centimeter (cm)", "Meter (m)", "Kilometer (km)"]
    let toLengthOptions = ["Select an option", "Centimeter (cm)", "Millimeter (mm)", "Meter (m)", "Kilometer (km)"]
    
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
                        
                        Picker("Select Option", selection: $fromLength){
                            ForEach(fromLengthOptions, id: \.self) {
                                option in
                                Text(option)
                            }
                        }
                        .onChange(of: fromLength) { _ in
                            if !toLength.isEmpty && !input.isEmpty {
                                convertedLength = String(format: "%.7f", (lengthConvertor(temp: Double(input) ?? 0, convertFrom: fromLength, convertTo: toLength)))
                            }
                        }
                        
                        Spacer()
                        
                    }
                    .padding()
                    
                    HStack{
                        
                        Spacer()
                        
                        Text("To")
                            .foregroundStyle(.colorSet1)
                        
                        
                        Picker("Select Option", selection: $toLength){
                            ForEach(toLengthOptions, id: \.self) {
                                option in
                                Text(option)
                            }
                        }
                        .onChange(of: toLength) { _ in
                            if !toLength.isEmpty && !input.isEmpty {
                                convertedLength = String(format: "%.7f", (lengthConvertor(temp: Double(input) ?? 0, convertFrom: fromLength, convertTo: toLength)))
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                    HStack{
                        Button (action:{
                            
                            convertedLength = String(format: "%.7f", (lengthConvertor(temp: Double(input) ?? 0, convertFrom: fromLength, convertTo: toLength)))
                            
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
                            fromLength = "Millimeter (mm)"
                            toLength = ""
                            convertedLength = ""
                            
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
                        
                        
                        
                        if toLength == "Millimeter (mm)" {
                            Text("\(convertedLength) mm")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toLength == "Centimeter (cm)" {
                            Text("\(convertedLength) cm")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toLength == "Meter (m)" {
                            Text("\(convertedLength) m")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        else if toLength == "Kilometer (km)" {
                            Text("\(convertedLength) km")
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
                    
                    
                    .navigationTitle("Length Convertor")
                    .foregroundStyle(.colorSet1)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

func lengthConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "Millimeter (mm)" && convertTo == "Centimeter (cm)"{
        result = temp / 10
    }
    
    else if convertFrom == "Millimeter (mm)" && convertTo == "Meter (m)"{
        result = temp / 1000
    }
    
    else if convertFrom == "Millimeter (mm)" && convertTo == "Kilometer (km)"{
        result = temp / 1000000
    }
    
    else if convertFrom == "Centimeter (cm)" && convertTo == "Millimeter (mm)"{
        result = temp * 10
    }
    
    else if convertFrom == "Centimeter (cm)" && convertTo == "Meter (m)"{
        result = temp/100
    }
    
    else if convertFrom == "Centimeter (cm)" && convertTo == "Kilometer (km)"{
        result = temp/100000
    }
    
    else if convertFrom == "Meter (m)" && convertTo == "Millimeter (mm)"{
        result = temp * 1000
    }
    
    else if convertFrom == "Meter (m)" && convertTo == "Centimeter (cm)"{
        result = temp * 100
    }
    
    else if convertFrom == "Meter (m)" && convertTo == "Kilometer (km)"{
        result = temp/1000
    }
    
    else if convertFrom == "Kilometer (km)" && convertTo == "Millimeter (mm)"{
        result = temp/1000000
    }
    
    else if convertFrom == "Kilometer (km)" && convertTo == "Centimeter (cm)"{
        result = temp/100000
    }
    
    else if convertFrom == "Kilometer (km)" && convertTo == "Meter (m)"{
        result = temp * 1000
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    LengthConvertor()
}
