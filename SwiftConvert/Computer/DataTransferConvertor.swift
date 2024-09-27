//
//  DataTransferConvertor.swift
//  SwiftConvert
//
//  Created by Akshat Srivastava on 25/09/24.
//

import SwiftUI

struct DataTransferConvertor: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var input: String = ""
    @State private var fromDataTransfer = "kb/s"
    @State private var toDataTransfer: String = "kB/s"
    @State private var outputDataTransfer = ""
    
    let fromDataTransferOptions = ["kb/s", "kB/s", "Mb/s", "MB/s", "Gb/s", "GB/s"]
    let toDataTransferOptions = ["kb/s", "kB/s", "Mb/s", "MB/s", "Gb/s", "GB/s"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Data Transfer")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        
                        ScrollView(.vertical, showsIndicators: false){
                                VStack {
                                    Text("Enter Data Transfer Speed:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Picker("Select Option", selection: $fromDataTransfer){
                                        ForEach(fromDataTransferOptions, id: \.self){
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

                                    
                                    
                                    Text("To Data Transfer Speed:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top)
                                    
                                    Picker("Select Option", selection: $toDataTransfer){
                                        ForEach(fromDataTransferOptions, id: \.self){
                                            option in
                                            Text(option)
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                    .pickerStyle(.segmented)
                                    .background(RoundedRectangle(cornerRadius:8)
                                        .fill(.fontColor2.opacity(0.2)))
                                    
                                    TextField("To", text: $outputDataTransfer)
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
                                                outputDataTransfer = String(format: "%.7f", (dataTransferConvertor(temp: Double(input) ?? 0, convertFrom: fromDataTransfer, convertTo: toDataTransfer)))
                                            }
                                            else if input == ""{
                                                outputDataTransfer = errors()
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
                                            outputDataTransfer = ""
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

func dataTransferConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "kb/s" && convertTo == "kB/s"{
        result = temp / 8
    }
    
    else if convertFrom == "kb/s" && convertTo == "Mb/s"{
        result = temp / 1000
    }
    
    else if convertFrom == "kb/s" && convertTo == "MB/s"{
        result = temp / 8000
    }
    
    else if convertFrom == "kb/s" && convertTo == "Gb/s"{
        result = temp / 1000000
    }
    
    else if convertFrom == "kb/s" && convertTo == "GB/s"{
        result = temp / 1000000
    }
    
    else if convertFrom == "kB/s" && convertTo == "kb/s"{
        result = temp * 8
    }
    
    else if convertFrom == "kB/s" && convertTo == "Mb/s"{
        result = temp / 125
    }
    
    else if convertFrom == "kB/s" && convertTo == "MB/s"{
        result = temp / 1000
    }
    
    else if convertFrom == "kB/s" && convertTo == "Gb/s"{
        result = temp / 125000
    }
    
    else if convertFrom == "kB/s" && convertTo == "GB/s"{
        result = temp / 1000000
    }
    
    else if convertFrom == "Mb/s" && convertTo == "kb/s"{
        result = temp * 1000
    }
    
    else if convertFrom == "Mb/s" && convertTo == "kB/s"{
        result = temp * 125
    }
    
    else if convertFrom == "Mb/s" && convertTo == "MB/s"{
        result = temp / 8
    }
    
    else if convertFrom == "Mb/s" && convertTo == "Gb/s"{
        result = temp / 1000
    }
    
    else if convertFrom == "Mb/s" && convertTo == "GB/s"{
        result = temp / 8000
    }
    
    else if convertFrom == "MB/s" && convertTo == "kb/s"{
        result = temp * 8000
    }
    
    else if convertFrom == "MB/s" && convertTo == "kB/s"{
        result = temp * 1000
    }
    
    else if convertFrom == "MB/s" && convertTo == "Mb/s"{
        result = temp * 8
    }
    
    else if convertFrom == "MB/s" && convertTo == "Gb/s"{
        result = temp / 125
    }
    
    else if convertFrom == "MB/s" && convertTo == "GB/s"{
        result = temp / 1000
    }
    
    else if convertFrom == "Gb/s" && convertTo == "kb/s"{
        result = temp * 1000000
    }
    
    else if convertFrom == "Gb/s" && convertTo == "kB/s"{
        result = temp * 125000
    }
    
    else if convertFrom == "Gb/s" && convertTo == "Mb/s"{
        result = temp * 1000
    }
    
    else if convertFrom == "Gb/s" && convertTo == "MB/s"{
        result = temp * 125
    }
    
    else if convertFrom == "Gb/s" && convertTo == "GB/s"{
        result = temp / 8
    }
    
    else if convertFrom == "GB/s" && convertTo == "kb/s"{
        result = temp * 8000000
    }
    
    else if convertFrom == "GB/s" && convertTo == "kB/s"{
        result = temp * 1000000
    }
    
    else if convertFrom == "GB/s" && convertTo == "Mb/s"{
        result = temp * 8000
    }
    
    else if convertFrom == "GB/s" && convertTo == "MB/s"{
        result = temp * 1000
    }
    
    else if convertFrom == "GB/s" && convertTo == "Gb/s"{
        result = temp * 8
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    DataTransferConvertor()
        .environmentObject(ColorThemeManager())
}
