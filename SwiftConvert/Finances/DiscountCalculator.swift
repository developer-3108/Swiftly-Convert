import SwiftUI

struct DiscountCalculator: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State public var originalAmount: String = ""
    @State public var discount: String = ""
    @State private var finalPrice: String = ""
    @State private var savings: String = ""
    @State private var temp: String = ""
    @State private var errorMessage: String = ""
    

    var body: some View {
        
        NavigationStack {
            ZStack{
                LinearGradient(colors: colorThemeManager.gradientColors(),
                               startPoint: .topTrailing,
                               endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        Text("Discount")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            VStack {
                                Text("Enter Original Price:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("Original Price", text: $originalAmount)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                    )
                                
                                
                                Text("Enter Discount(%):")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top)
                                
                                TextField("Discount (%)", text: $discount)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                    )
                                
                                HStack{
                                    Button {
                                        if originalAmount != "" || discount != "" || temp != ""{
                                            temp = String(format: "%.2f", Double(discountCalculator(originalPrice: Double(originalAmount) ?? 0, discount: Double(discount) ?? 0)))
                                                          
                                            
                                            finalPrice = String(format: "%.2f", (Double(originalAmount) ?? 0) - Double(discountCalculator(originalPrice: Double(originalAmount) ?? 0, discount: Double(discount) ?? 0)))
                                        }
                    
                                    } label: {
                                        ZStack{
                                            RoundedRectangle(cornerRadius: 10)
                                                .frame(width: .infinity, height: 50)
                                                .foregroundStyle(.fontColor1)
                                            
                                            Text("Calculate")
                                                .foregroundStyle(.fontColor2)
                                                .font(.system(size: 25))
                                                .fontWeight(.semibold)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        originalAmount = ""
                                        discount = ""
                                        temp = ""
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
                                .padding(.top)
                                
                                if temp != ""{
                                    
                                    Text("Final Price:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top)
                                    
                                    TextField("", text: $finalPrice)
                                        .padding()
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.fontColor1.opacity(0.1))
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                    
                                    Text("Total Savings:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top)
                                    
                                    TextField("", text: $temp)
                                        .padding()
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.fontColor1.opacity(0.1))
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                }
                            }
                            .frame(width: .infinity)
                            .frame(maxWidth: 750)
                            .padding(.vertical)
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

func discountCalculator(originalPrice: Double, discount: Double) -> Double{
    let discountPercentage = discount / 100
    
    return originalPrice * discountPercentage

}

#Preview {
    DiscountCalculator()
        .environmentObject(ColorThemeManager())
}
