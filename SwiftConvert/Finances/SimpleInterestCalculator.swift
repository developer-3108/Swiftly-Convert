import SwiftUI

struct SimpleInterestCalculator: View {
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    @State public var amount: String = ""
    @State public var interest: String = ""
    @State public var year: String = ""
    @State public var month: String = ""
    @State public var day: String = ""
    @State private var finalAmount: String = ""
    @State private var principalAmount: String = ""
    @State private var interestAmount: String = ""
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
                        Text("Simple Interest")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.vertical, showsIndicators: false){
                            
                            VStack {
                                Text("Enter Amount:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                TextField("Amount", text: $amount)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                    )
                                
                                
                                Text("Enter Interest:")
                                    .foregroundStyle(.fontColor1)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.top)
                                
                                TextField("Interest", text: $interest)
                                    .keyboardType(.decimalPad)
                                    .padding()
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                    )
                                
                                HStack{
                                    Text("Enter Period:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top)
                                    
                                    TextField("yy", text: $year)
                                        .keyboardType(.numberPad)
                                        .padding()
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                        .padding(.top)
                                    
                                    Spacer()
                                    
                                    TextField("mm", text: $month)
                                        .keyboardType(.numberPad)
                                        .padding()
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                        .padding(.top)
                                    
                                    Spacer()
                                    
                                    TextField("dd", text: $day)
                                        .keyboardType(.numberPad)
                                        .padding()
                                        .font(.title3)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                        .padding(.top)
                                }
                                
                                HStack{
                                    Button {
                                        if amount != "" || interest != "" || year != "" || month != "" || day != "" || temp != ""{
                                            temp = String(format: "%.2f", (simpleInterest(principal: Double(amount) ?? 0, interestRate: Double(interest) ?? 0, yy: Double(year) ?? 0, mm: Double(month) ?? 0, dd: Double(day) ?? 0)))
                                            
                                            finalAmount = String(format: "%.2f", (Double(amount) ?? 0) + Double(simpleInterest(principal: Double(amount) ?? 0, interestRate: Double(interest) ?? 0, yy: Double(year) ?? 0, mm: Double(month) ?? 0, dd: Double(day) ?? 0)))
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
                                        amount = ""
                                        interest = ""
                                        year = ""
                                        month = ""
                                        day = ""
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
                                    Text("Principal Amount:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top)
                                    
                                    TextField("", text: $amount)
                                        .padding()
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(.fontColor1.opacity(0.1))
                                                .strokeBorder(.fontColor1.opacity(0.8), style: StrokeStyle(lineWidth: 2.0))
                                        )
                                    
                                    Text("Interest Amount:")
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
                                    
                                    Text("Total Amount:")
                                        .foregroundStyle(.fontColor1)
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.top)
                                    
                                    TextField("", text: $finalAmount)
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

func simpleInterest(principal: Double, interestRate: Double, yy: Double, mm: Double, dd: Double) -> Double{
    let time = yy +  mm/12 + dd/365
    
    return (principal * interestRate * time) / 100

}

#Preview {
    SimpleInterestCalculator()
        .environmentObject(ColorThemeManager())
}
