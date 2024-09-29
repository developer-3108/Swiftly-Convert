

import SwiftUI

struct LengthConvertor: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var input: String = ""
    @State private var fromLength = "Millimeter"
    @State private var toLength: String = "Centimeter"
    @State private var outputLength = ""
    
    let fromLengthOptions = ["Millimeter", "Centimeter", "Meter", "Kilometer"]
    let toLengthOptions = ["Millimeter", "Centimeter", "Meter", "Kilometer"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Length")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            VStack {
                                Text("Enter Length:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Picker("Select Option", selection: $fromLength){
                                    ForEach(fromLengthOptions, id: \.self){
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
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                    )
                                    .padding(.top)

                                
                                
                                Text("To Length:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top)
                                
                                Picker("Select Option", selection: $toLength){
                                    ForEach(fromLengthOptions, id: \.self){
                                        option in
                                        Text(option)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .pickerStyle(.segmented)
                                .background(RoundedRectangle(cornerRadius:8)
                                    .fill(.fontColor2.opacity(0.2)))
                                
                                TextField("To", text: $outputLength)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .font(.title2)
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
                                            outputLength = String(format: "%.7f", (lengthConvertor(temp: Double(input) ?? 0, convertFrom: fromLength, convertTo: toLength)))
                                        }
                                        else if input == ""{
                                            outputLength = errors()
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
                                        outputLength = ""
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
                            .frame(width: .infinity)
                            .frame(maxWidth: 750)
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

func errors() -> String{
    return "Error! Invalid Input"
}

func lengthConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "Millimeter" && convertTo == "Centimeter"{
        result = temp / 10
    }
    
    else if convertFrom == "Millimeter" && convertTo == "Meter"{
        result = temp / 1000
    }
    
    else if convertFrom == "Millimeter" && convertTo == "Kilometer"{
        result = temp / 1000000
    }
    
    else if convertFrom == "Centimeter" && convertTo == "Millimeter"{
        result = temp * 10
    }
    
    else if convertFrom == "Centimeter" && convertTo == "Meter"{
        result = temp/100
    }
    
    else if convertFrom == "Centimeter" && convertTo == "Kilometer"{
        result = temp/100000
    }
    
    else if convertFrom == "Meter" && convertTo == "Millimeter"{
        result = temp * 1000
    }
    
    else if convertFrom == "Meter" && convertTo == "Centimeter"{
        result = temp * 100
    }
    
    else if convertFrom == "Meter" && convertTo == "Kilometer"{
        result = temp/1000
    }
    
    else if convertFrom == "Kilometer" && convertTo == "Millimeter"{
        result = temp * 1000000
    }
    
    else if convertFrom == "Kilometer" && convertTo == "Centimeter"{
        result = temp * 100000
    }
    
    else if convertFrom == "Kilometer" && convertTo == "Meter"{
        result = temp * 1000
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    LengthConvertor()
        .environmentObject(ColorThemeManager())
}

