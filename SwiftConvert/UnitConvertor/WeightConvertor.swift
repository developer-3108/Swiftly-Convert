import SwiftUI

struct WeightConvertor: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State private var input: String = ""
    @State private var fromWeight = "Tons"
    @State private var toWeight: String = "Pounds"
    @State private var outputWeight = ""
    
    let fromWeightOptions = ["Tons", "Pounds", "Grams", "Kilograms"]
    let toWeightOptions = ["Tons", "Pounds", "Grams", "Kilograms"]
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Weight")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            VStack {
                                Text("Enter Weight:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Picker("Select Option", selection: $fromWeight){
                                    ForEach(fromWeightOptions, id: \.self){
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
                                
                                
                                Text("To Weight:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top)
                                
                                Picker("Select Option", selection: $toWeight){
                                    ForEach(toWeightOptions, id: \.self){
                                        option in
                                        Text(option)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .background(RoundedRectangle(cornerRadius:8)
                                    .fill(.fontColor2.opacity(0.2)))
                                
                                TextField("To", text: $outputWeight)
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
                                            outputWeight = String(format: "%.7f", (weightConvertor(temp: Double(input) ?? 0, convertFrom: fromWeight, convertTo: toWeight)))
                                        }
                                        else if input == ""{
                                            outputWeight = errors()
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
                                        outputWeight = ""
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


func weightConvertor(temp: Double, convertFrom: String, convertTo: String) ->Double {
    var result: Double
    
    if convertFrom == "Tons" && convertTo == "Pounds"{
        result = temp * 2000
    }
    
    else if convertFrom == "Tons" && convertTo == "Grams"{
        result = temp * 1000000
    }
    
    else if convertFrom == "Tons" && convertTo == "Kilograms"{
        result = temp * 1000
    }
    
    else if convertFrom == "Pounds" && convertTo == "Tons"{
        result = temp / 2000
    }
    
    else if convertFrom == "Pounds" && convertTo == "Grams"{
        result = temp * 453.6
    }
    
    else if convertFrom == "Pounds" && convertTo == "Kilograms"{
        result = temp / 2.205
    }
    
    else if convertFrom == "Grams" && convertTo == "Tons"{
        result = temp / 907200
    }
    
    else if convertFrom == "Grams" && convertTo == "Pounds"{
        result = temp / 453.6
    }
    
    else if convertFrom == "Grams" && convertTo == "Kilograms"{
        result = temp / 1000
    }
    
    else if convertFrom == "Kilograms" && convertTo == "Tons"{
        result = temp / 907.2
    }
    
    else if convertFrom == "Kilograms" && convertTo == "Pounds"{
        result = temp * 2.205
    }
    
    else if convertFrom == "Kilograms" && convertTo == "Grams"{
        result = temp * 1000
    }
    
    else{
        result = temp
    }
    
    return result
}



#Preview {
    WeightConvertor()
        .environmentObject(ColorThemeManager())
}
