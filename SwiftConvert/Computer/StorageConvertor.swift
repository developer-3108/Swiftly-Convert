//
//  StorageConvertor.swift
//  SwiftConvert
//
//  Created by Akshat Srivastava on 25/09/24.
//

import SwiftUI

struct StorageConvertor: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var input: String = ""
    @State private var fromStorage = "B"
    @State private var toStorage: String = "KB"
    @State private var outputStorage = ""
    
    let fromStorageOptions = ["B", "KB", "MB", "GB", "TB", "PB"]
    let toStorageOptions = ["B", "KB", "MB", "GB", "TB", "PB"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Storage Convertor")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        
                        ScrollView(.vertical, showsIndicators: false){
                                VStack {
                                    Text("Enter Storage:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Picker("Select Option", selection: $fromStorage){
                                        ForEach(fromStorageOptions, id: \.self){
                                            option in
                                            Text(option)
                                        }
                                    }
                                    .pickerStyle(.segmented)
                                    .frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius:8)
                                        .fill(.fontColor2.opacity(0.2)))
                                    .font(.title2)

                                    
                                    TextField("From", text: $input)
                                        .frame(maxWidth: .infinity)
                                        .keyboardType(.decimalPad)
                                        .padding()
                                        .font(.title)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                        .padding(.top)

                                    
                                    
                                    Text("To Storage:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top)
                                    
                                    Picker("Select Option", selection: $toStorage){
                                        ForEach(fromStorageOptions, id: \.self){
                                            option in
                                            Text(option)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .pickerStyle(.segmented)
                                    .background(RoundedRectangle(cornerRadius:8)
                                        .fill(.fontColor2.opacity(0.2)))
                                    
                                    TextField("To", text: $outputStorage)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .font(.title)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.fontColor1.opacity(0.1))
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                        .padding(.top)
                                    
                                    HStack{
                                        Button {
                                            if input != ""{
                                                outputStorage = String(format: "%.7f", (storageConvertor(temp: Double(input) ?? 0, convertFrom: fromStorage, convertTo: toStorage)))
                                            }
                                            else if input == ""{
                                                outputStorage = errors()
                                            }
                                        } label: {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: .infinity, height: 50)
                                                    .foregroundStyle(.fontColor1)
                                                
                                                Text("Convert")
                                                    .foregroundStyle(.fontColor2)
                                                    .font(.system(size: 25))
                                                    .fontWeight(.semibold)
                                            }
                                        }
                                        
                                        Spacer()
                                        
                                        Button {
                                            input = ""
                                            outputStorage = ""
                                        } label: {
                                            ZStack{
                                                RoundedRectangle(cornerRadius: 10)
                                                    .frame(width: .infinity, height: 50)
                                                    .foregroundStyle(.gray)
                                                
                                                Text("Reset")
                                                    .foregroundStyle(.fontColor2)
                                                    .font(.system(size: 25))
                                                    .fontWeight(.semibold)
                                            }
                                        }
                                        
                                    }
                                    .padding(.vertical)
                                }
                                .padding(.top)
                                .vTop()
                                .padding(.horizontal)
                                .background(
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundStyle(.fontColor1.opacity(0.1))
                                        .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                                )
                        }
                    }
                    .padding(.horizontal)
                    .vTop()
            }
        }
    }
}

func storageConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "B" && convertTo == "KB"{
        result = temp * 0.001
    }
    
    else if convertFrom == "B" && convertTo == "MB"{
        result = temp / 1000000
    }
    
    else if convertFrom == "B" && convertTo == "GB"{
        result = temp / 1000000000
    }
    
    else if convertFrom == "B" && convertTo == "TB"{
        result = temp / 1000000000000
    }
    
    else if convertFrom == "B" && convertTo == "PB"{
        result = temp / 1000000000000000
    }
    
    else if convertFrom == "KB" && convertTo == "B"{
        result = temp * 1024
    }
    
    else if convertFrom == "KB" && convertTo == "MB"{
        result = temp / 1000
    }
    
    else if convertFrom == "KB" && convertTo == "GB"{
        result = temp / 1000000
    }
    
    else if convertFrom == "KB" && convertTo == "TB"{
        result = temp / 1000000000
    }
    
    else if convertFrom == "KB" && convertTo == "PB"{
        result = temp * 1000000000000
    }
    
    else if convertFrom == "MB" && convertTo == "B"{
        result = temp * 1000000
    }
    
    else if convertFrom == "MB" && convertTo == "KB"{
        result = temp * 1000
    }
    
    else if convertFrom == "MB" && convertTo == "GB"{
        result = temp / 1000
    }
    
    else if convertFrom == "MB" && convertTo == "TB"{
        result = temp / 1000000
    }
    
    else if convertFrom == "MB" && convertTo == "PB"{
        result = temp / 1000000000
    }
    
    else if convertFrom == "GB" && convertTo == "B"{
        result = temp * 1000000000
    }
    
    else if convertFrom == "GB" && convertTo == "MB"{
        result = temp * 1000
    }
    
    else if convertFrom == "GB" && convertTo == "TB"{
        result = temp / 1000
    }
    
    else if convertFrom == "GB" && convertTo == "PB"{
        result = temp / 1000000
    }
    
    else if convertFrom == "TB" && convertTo == "B"{
        result = temp * 1000000000000
    }
    
    else if convertFrom == "TB" && convertTo == "KB"{
        result = temp * 1000000000
    }
    
    else if convertFrom == "TB" && convertTo == "MB"{
        result = temp * 1000000
    }
    
    else if convertFrom == "TB" && convertTo == "GB"{
        result = temp * 1000
    }
    
    else if convertFrom == "TB" && convertTo == "PB"{
        result = temp / 1000
    }
    
    else if convertFrom == "PB" && convertTo == "B"{
        result = temp * 1000000000000000
    }
    
    else if convertFrom == "PB" && convertTo == "KB"{
        result = temp * 1000000000000
    }
    
    else if convertFrom == "PB" && convertTo == "MB"{
        result = temp * 1000000000
    }
    
    else if convertFrom == "PB" && convertTo == "GB"{
        result = temp * 1000000
    }
    
    else if convertFrom == "PB" && convertTo == "TB"{
        result = temp * 1000
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    StorageConvertor()
        .environmentObject(ColorThemeManager())
}
