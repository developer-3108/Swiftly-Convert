
import SwiftUI

struct SpeedConvertor: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var input: String = ""
    @State private var fromSpeed = "km/h"
    @State private var toSpeed: String = "m/s"
    @State private var outputSpeed = ""
    
    let fromSpeedOptions = ["km/h", "m/s", "mi/h", "mi/s", "ft/h", "ft/s", "knots"]
    let toSpeedOptions = ["km/h", "m/s", "mi/h", "mi/s", "ft/h", "ft/s", "knots"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Speed")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            VStack {
                                Text("Enter Speed:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Picker("Select Option", selection: $fromSpeed){
                                    ForEach(fromSpeedOptions, id: \.self){
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
                                
                                
                                Text("To Speed:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top)
                                
                                Picker("Select Option", selection: $toSpeed){
                                    ForEach(fromSpeedOptions, id: \.self){
                                        option in
                                        Text(option)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .background(RoundedRectangle(cornerRadius:8)
                                    .fill(.fontColor2.opacity(0.2)))
                                
                                TextField("To", text: $outputSpeed)
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
                                            outputSpeed = String(format: "%.2f", (speedConvertor(temp: Double(input) ?? 0, convertFrom: fromSpeed, convertTo: toSpeed)))
                                        }
                                        else if input == ""{
                                            outputSpeed = errors()
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
                                        outputSpeed = ""
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

func speedConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "km/h" && convertTo == "m/s"{
        result = temp / 3.6
    }
    
    else if convertFrom == "km/h" && convertTo == "mi/h"{
        result = temp * 0.621371
    }
    
    else if convertFrom == "km/h" && convertTo == "mi/s"{
        result = temp / 5794
    }
    
    else if convertFrom == "km/h" && convertTo == "ft/h"{
        result = temp * 3281
    }
    
    else if convertFrom == "km/h" && convertTo == "ft/s"{
        result = temp / 1.097
    }
    
    else if convertFrom == "km/h" && convertTo == "knots"{
        result = temp * 0.539957
    }
    
    else if convertFrom == "m/s" && convertTo == "km/h"{
        result = temp * 3.6
    }
    
    else if convertFrom == "m/s" && convertTo == "mi/h"{
        result = temp * 2.237
    }
    
    else if convertFrom == "m/s" && convertTo == "mi/s"{
        result = temp / 1609
    }
    
    else if convertFrom == "m/s" && convertTo == "ft/h"{
        result = temp * 11811.02362
    }
    
    else if convertFrom == "m/s" && convertTo == "ft/s"{
        result = temp * 3.281
    }
    
    else if convertFrom == "m/s" && convertTo == "knots"{
        result = temp * 1.944
    }
    
    else if convertFrom == "mi/h" && convertTo == "km/h"{
        result = temp * 1.609
    }
    
    else if convertFrom == "mi/h" && convertTo == "m/s"{
        result = temp / 2.237
    }
    
    else if convertFrom == "mi/h" && convertTo == "mi/s"{
        result = temp / 3600
    }
    
    else if convertFrom == "mi/h" && convertTo == "ft/h"{
        result = temp * 5280
    }
    
    else if convertFrom == "mi/h" && convertTo == "ft/s"{
        result = temp * 1.467
    }
    
    else if convertFrom == "mi/h" && convertTo == "knots"{
        result = temp / 1.151
    }
    
    else if convertFrom == "mi/s" && convertTo == "km/h"{
        result = temp * 5794
    }
    
    else if convertFrom == "mi/s" && convertTo == "m/s"{
        result = temp * 1609
    }
    
    else if convertFrom == "mi/s" && convertTo == "mi/h"{
        result = temp * 3600
    }
    
    else if convertFrom == "mi/s" && convertTo == "ft/h"{
        result = temp * 19200000
    }
    
    else if convertFrom == "mi/s" && convertTo == "ft/s"{
        result = temp * 5780
    }
    
    else if convertFrom == "mi/s" && convertTo == "knots"{
        result = temp * 3128.3144708423
    }
    
    else if convertFrom == "ft/h" && convertTo == "km/h"{
        result = temp / 3281
    }
    
    else if convertFrom == "ft/h" && convertTo == "m/s"{
        result = temp / 11810
    }
    
    else if convertFrom == "ft/h" && convertTo == "mi/h"{
        result = temp / 5280
    }
    
    else if convertFrom == "ft/h" && convertTo == "mi/s"{
        result = temp / 11811.02362
    }
    
    else if convertFrom == "ft/h" && convertTo == "ft/s"{
        result = temp / 3600
    }
    
    else if convertFrom == "ft/h" && convertTo == "knots"{
        result = temp / 6076
    }
    
    else if convertFrom == "ft/s" && convertTo == "km/h"{
        result = temp * 1.097
    }
    
    else if convertFrom == "ft/s" && convertTo == "m/s"{
        result = temp / 3.281
    }
    
    else if convertFrom == "ft/s" && convertTo == "mi/h"{
        result = temp / 1.467
    }
    
    else if convertFrom == "ft/s" && convertTo == "mi/s"{
        result = temp / 5280
    }
    
    else if convertFrom == "ft/s" && convertTo == "ft/h"{
        result = temp * 3600
    }
    
    else if convertFrom == "ft/s" && convertTo == "knots"{
        result = temp / 1.688
    }
    
    else if convertFrom == "knots" && convertTo == "km/h"{
        result = temp * 1.852
    }
    
    else if convertFrom == "knots" && convertTo == "m/s"{
        result = temp * 0.514444
    }
    
    else if convertFrom == "knots" && convertTo == "mi/h"{
        result = temp * 1.151
    }
    
    else if convertFrom == "knots" && convertTo == "mi/s"{
        result = temp * 0.00115078
    }
    
    else if convertFrom == "knots" && convertTo == "ft/h"{
        result = temp * 6076.1154855643
    }
    
    else if convertFrom == "knots" && convertTo == "ft/s"{
        result = temp * 1.688
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    SpeedConvertor()
        .environmentObject(ColorThemeManager())
}
