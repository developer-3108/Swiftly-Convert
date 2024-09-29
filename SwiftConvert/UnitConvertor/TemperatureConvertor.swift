
import SwiftUI

struct TemperatureConvertor: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var input: String = ""
    @State private var fromTemperature = "Celsius"
    @State private var toTemperature: String = "Fahrenheit"
    @State private var outputTemperature = ""
    
    let fromTemperatureOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    let toTemperatureOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Temperature")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            VStack {
                                Text("Enter Temperature:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Picker("Select Option", selection: $fromTemperature){
                                    ForEach(fromTemperatureOptions, id: \.self){
                                        option in
                                        Text(option)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .background(RoundedRectangle(cornerRadius:8)
                                    .fill(.fontColor2.opacity(0.2)))
                                
                                TextField("From", text: $input)
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
                                
                                Picker("Select Option", selection: $toTemperature){
                                    ForEach(fromTemperatureOptions, id: \.self){
                                        option in
                                        Text(option)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .background(RoundedRectangle(cornerRadius:8)
                                    .fill(.fontColor2.opacity(0.2)))
                                
                                TextField("To", text: $outputTemperature)
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
                                            outputTemperature = String(format: "%.2f", (temperatureConvertor(temp: Double(input) ?? 0, convertFrom: fromTemperature, convertTo: toTemperature)))
                                        }
                                        else if input == ""{
                                            outputTemperature = errors()
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
                                        outputTemperature = ""
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
        .environmentObject(ColorThemeManager())
}
