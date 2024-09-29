import SwiftUI

struct VolumeConvertor: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var input: String = ""
    @State private var fromVolume = "L"
    @State private var toVolume: String = "mL"
    @State private var outputVolume = ""
    
    let fromVolumeOptions = ["L", "mL", "m^3", "cm^3", "mm^3", "ft^3", "Gallon"]
    let toVolumeOptions = ["L", "mL", "m^3", "cm^3", "mm^3", "ft^3", "Gallon"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack{
                    Text("Volume")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(.fontColor1)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        VStack {
                            Text("Enter Volume:")
                                .foregroundStyle(.fontColor1)
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Picker("From Volume", selection: $fromVolume){
                                ForEach(fromVolumeOptions, id: \.self){
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
                            
                            
                            Text("To Volume:")
                                .foregroundStyle(.fontColor1)
                                .font(.title3)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top)
                            
                            Picker("To Volume", selection: $toVolume){
                                ForEach(toVolumeOptions, id: \.self){
                                    option in
                                    Text(option)
                                }
                            }
                            .pickerStyle(.segmented)
                            .background(RoundedRectangle(cornerRadius:8)
                                .fill(.fontColor2.opacity(0.2)))
                            
                            TextField("To", text: $outputVolume)
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
                                        outputVolume = String(format: "%.7f", (volumeConvertor(temp: Double(input) ?? 0, convertFrom: fromVolume, convertTo: toVolume)))
                                    }
                                    else if input == ""{
                                        outputVolume = errors()
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
                                    outputVolume = ""
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

func volumeConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "L" && convertTo == "mL"{
        result = temp * 1000
    }
    
    else if convertFrom == "L" && convertTo == "m^3"{
        result = temp / 1000
    }
    
    else if convertFrom == "L" && convertTo == "cm^3"{
        result = temp * 1000
    }
    
    else if convertFrom == "L" && convertTo == "mm^3"{
        result = temp * 1000000
    }
    
    else if convertFrom == "L" && convertTo == "ft^3"{
        result = temp / 28.317
    }
    
    else if convertFrom == "L" && convertTo == "Gallon"{
        result = temp / 3.785
    }
    
    else if convertFrom == "mL" && convertTo == "L"{
        result = temp / 1000
    }
    
    else if convertFrom == "mL" && convertTo == "m^3"{
        result = temp / 1000000
    }
    
    else if convertFrom == "mL" && convertTo == "cm^3"{
        result = temp * 1
    }
    
    else if convertFrom == "mL" && convertTo == "mm^3"{
        result = temp * 1000
    }
    
    else if convertFrom == "mL" && convertTo == "ft^3"{
        result = temp / 28320
    }
    
    else if convertFrom == "mL" && convertTo == "Gallon"{
        result = temp / 3785
    }
    
    else if convertFrom == "m^3" && convertTo == "L"{
        result = temp * 1000
    }
    
    else if convertFrom == "m^3" && convertTo == "mL"{
        result = temp * 1000000
    }
    
    else if convertFrom == "m^3" && convertTo == "cm^3"{
        result = temp * 1000000
    }
    
    else if convertFrom == "m^3" && convertTo == "mm^3"{
        result = temp * 1000000000
    }
    
    else if convertFrom == "m^3" && convertTo == "ft^3"{
        result = temp * 35.315
    }
    
    else if convertFrom == "m^3" && convertTo == "Gallon"{
        result = temp * 264.2
    }
    
    else if convertFrom == "cm^3" && convertTo == "L"{
        result = temp / 1000
    }
    
    else if convertFrom == "cm^3" && convertTo == "mL"{
        result = temp * 1
    }
    
    else if convertFrom == "cm^3" && convertTo == "m^3"{
        result = temp / 1000000
    }
    
    else if convertFrom == "cm^3" && convertTo == "mm^3"{
        result = temp * 1000
    }
    
    else if convertFrom == "cm^3" && convertTo == "ft^3"{
        result = temp / 28320
    }
    
    else if convertFrom == "cm^3" && convertTo == "Gallon"{
        result = temp / 3785
    }
    
    else if convertFrom == "mm^3" && convertTo == "L"{
        result = temp / 1000000
    }
    
    else if convertFrom == "mm^3" && convertTo == "mL"{
        result = temp / 1000
    }
    
    else if convertFrom == "mm^3" && convertTo == "m^3"{
        result = temp / 1000000000
    }
    
    else if convertFrom == "mm^3" && convertTo == "cm^3"{
        result = temp / 1000
    }
    
    else if convertFrom == "mm^3" && convertTo == "ft^3"{
        result = temp / 28316846.6
    }
    
    else if convertFrom == "mm^3" && convertTo == "Gallon"{
        result = temp / 3785411.784
    }
    
    else if convertFrom == "ft^3" && convertTo == "L"{
        result = temp * 28.317
    }
    
    else if convertFrom == "ft^3" && convertTo == "mL"{
        result = temp * 28316.8466
    }
    
    else if convertFrom == "ft^3" && convertTo == "m^3"{
        result = temp / 35.315
    }
    
    else if convertFrom == "ft^3" && convertTo == "cm^3"{
        result = temp * 28316.8466
    }
    
    else if convertFrom == "ft^3" && convertTo == "mm^3"{
        result = temp * 28316846.6
    }
    
    else if convertFrom == "ft^3" && convertTo == "Gallon"{
        result = temp * 7.481
    }
    
    else if convertFrom == "Gallon" && convertTo == "L"{
        result = temp * 3.785
    }
    
    else if convertFrom == "Gallon" && convertTo == "mL"{
        result = temp * 3785
    }
    
    else if convertFrom == "Gallon" && convertTo == "m^3"{
        result = temp / 264.2
    }
    
    else if convertFrom == "Gallon" && convertTo == "cm^3"{
        result = temp * 3785
    }
    
    else if convertFrom == "Gallon" && convertTo == "mm^3"{
        result = temp * 3785411.784
    }
    
    else if convertFrom == "Gallon" && convertTo == "ft^3"{
        result = temp / 7.48
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    VolumeConvertor()
        .environmentObject(ColorThemeManager())
}
