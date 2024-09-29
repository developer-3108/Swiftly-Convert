
import SwiftUI

struct AreaConvertor: View {
    @State private var input: String = ""
    @State private var fromArea = "Sq.km"
    @State private var toArea: String = "Sq.m"
    @State private var outputArea = ""
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    
    let fromAreaOptions = ["Sq.km", "Sq.m", "Sq.yd", "Sq.ft", "Sq.inch"]
    let toAreaOptions = ["Sq.km", "Sq.m", "Sq.yd", "Sq.ft", "Sq.inch"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Area")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            VStack {
                                Text("Enter Area:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Picker("From Area", selection: $fromArea){
                                    ForEach(fromAreaOptions, id: \.self){
                                        option in
                                        Text(option)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .pickerStyle(.segmented)
                                .background(RoundedRectangle(cornerRadius:8)
                                    .fill(.fontColor2.opacity(0.2)))
                                
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
                                
                                
                                Text("To Area:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top)
                                
                                Picker("To Area", selection: $toArea){
                                    ForEach(fromAreaOptions, id: \.self){
                                        option in
                                        Text(option)
                                    }
                                }
                                .frame(maxWidth: .infinity)
                                .pickerStyle(.segmented)
                                .background(RoundedRectangle(cornerRadius:8)
                                    .fill(.fontColor2.opacity(0.2)))
                                
                                TextField("To", text: $outputArea)
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
                                            outputArea = String(format: "%.7f", (areaConvertor(temp: Double(input) ?? 0, convertFrom: fromArea, convertTo: toArea)))
                                        }
                                        else if input == ""{
                                            outputArea = errors()
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
                                    .frame(maxWidth: .infinity)
                                    
                                    Spacer()
                                    
                                    Button {
                                        input = ""
                                        outputArea = ""
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

func areaConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "Sq.km" && convertTo == "Sq.m"{
        result = temp * 1000000
    }
    
    else if convertFrom == "Sq.km" && convertTo == "Sq.yd"{
        result = temp * 1195990.05
    }
    
    else if convertFrom == "Sq.km" && convertTo == "Sq.ft"{
        result = temp * 10763910.4
    }
    
    else if convertFrom == "Sq.km" && convertTo == "Sq.inch"{
        result = temp * 1550003100.006
    }
    
    else if convertFrom == "Sq.m" && convertTo == "Sq.km"{
        result = temp / 1000000
    }
    
    else if convertFrom == "Sq.m" && convertTo == "Sq.yd"{
        result = temp * 1.196
    }
    
    else if convertFrom == "Sq.m" && convertTo == "Sq.ft"{
        result = temp * 10.764
    }
    
    else if convertFrom == "Sq.m" && convertTo == "Sq.inch"{
        result = temp * 1550.003
    }
    
    else if convertFrom == "Sq.yd" && convertTo == "Sq.km"{
        result = temp / 1195990.05
    }
    
    else if convertFrom == "Sq.yd" && convertTo == "Sq.m"{
        result = temp / 1.196
    }
    
    else if convertFrom == "Sq.yd" && convertTo == "Sq.ft"{
        result = temp * 9
    }
    
    else if convertFrom == "Sq.yd" && convertTo == "Sq.inch"{
        result = temp * 1296
    }
    
    else if convertFrom == "Sq.ft" && convertTo == "Sq.km"{
        result = temp / 10763910.4
    }
    
    else if convertFrom == "Sq.ft" && convertTo == "Sq.m"{
        result = temp / 10.764
    }
    
    else if convertFrom == "Sq.ft" && convertTo == "Sq.yd"{
        result = temp / 9
    }
    
    else if convertFrom == "Sq.ft" && convertTo == "Sq.inch"{
        result = temp * 144
    }
    
    else if convertFrom == "Sq.inch" && convertTo == "Sq.km"{
        result = temp / 1550003100.006
    }
    
    else if convertFrom == "Sq.inch" && convertTo == "Sq.m"{
        result = temp / 1550
    }
    
    else if convertFrom == "Sq.inch" && convertTo == "Sq.yd"{
        result = temp / 1296
    }
    
    else if convertFrom == "Sq.inch" && convertTo == "Sq.ft"{
        result = temp / 144
    }
    
    else{
        result = temp
    }
    
    return result
}

#Preview {
    AreaConvertor()
        .environmentObject(ColorThemeManager())
}
