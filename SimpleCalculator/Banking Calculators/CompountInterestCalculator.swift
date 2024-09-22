//
//  CompountInterestCalculator.swift
//  SwiftlyConvert
//
//  Created by Akshat Srivastava on 13/08/24.
//

import SwiftUI

struct CompountInterestCalculator: View {
    @State private var amount: String = ""
    @State private var interest: String = ""
    @State private var year: String = ""
    @State private var month: String = ""
    @State private var day: String = ""
    @State private var finalAmount: String = ""
    @State private var principalAmount: String = ""
    @State private var interestAmount: String = ""
    @State private var temp: String = ""
    @State private var compounded: String = ""
    @State private var selectedOption = "Option 1"
    
    let options = ["Monthly", "Quartely", "Half Yearly", "Yearly"]
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                
                VStack{
                    VStack{
                        HStack{
                            Spacer()
                            
                            Text("Amount")
                                .foregroundStyle(.colorSet1)
                            
                            TextField("Ex: 1,00,00", text: $amount)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundStyle(.colorSet1)
                            
                            Spacer()
                            
                        }
                        
                        HStack{
                            Spacer()
                            
                            Text("Interest")
                                .foregroundStyle(.colorSet1)
                            
                            TextField("Ex: 7.5%", text: $interest)
                                .keyboardType(.decimalPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundStyle(.colorSet1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            
                            Text("Period (Years)")
                                .foregroundStyle(.colorSet1)
                            
                            TextField("Ex: Years", text: $year)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundStyle(.colorSet1)
                            
                            Spacer()
                            
                            TextField("Ex: Months", text: $month)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundStyle(.colorSet1)
                            
                            Spacer()
                            
                            TextField("Ex: Days", text: $day)
                                .keyboardType(.numberPad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundStyle(.colorSet1)
                            
                            Spacer()
                        }
                        
                        HStack{
                            Spacer()
                            
                            Text("Compounded")
                                .foregroundStyle(.colorSet1)
                            
                            Picker("Select Option", selection: $selectedOption) {
                                ForEach(options, id: \.self) {
                                    option in
                                    Text(option)
                                }
                            }
                            
                            Spacer()
                        }
                        
                        HStack{
                            Button (action: {
                                
                                temp = String(format: "%.2f", (compoundIntterest(principal: Double(amount) ?? 0, interestRate: Double(interest) ?? 0, yy: Double(year) ?? 0, mm: Double(month) ?? 0, dd: Double(day) ?? 0, selectedOption: String(selectedOption))))
                                
                                finalAmount = String(format: "%.2f", (Double(amount) ?? 0) + Double(compoundIntterest(principal: Double(amount) ?? 0, interestRate: Double(interest) ?? 0, yy: Double(year) ?? 0, mm: Double(month) ?? 0, dd: Double(day) ?? 0, selectedOption: selectedOption)))
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 170, height: 50)
                                        .foregroundStyle(.colorSet1)
                                    
                                    Text("Calculate")
                                        .foregroundStyle(.colorSet2)
                                        .font(.system(size: 25))
                                        .fontWeight(.semibold)
                                }
                            })
                            
                            Spacer()
                            
                            Button(action: {
                                
                                amount = ""
                                interest = ""
                                year = ""
                                month = ""
                                day = ""
                                temp = ""
                                selectedOption = "Monthly"
                                
                            }, label: {
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: 170, height: 50)
                                        .foregroundStyle(.gray)
                                    
                                    Text("Reset")
                                        .foregroundStyle(.colorSet2)
                                        .font(.system(size: 25))
                                        .fontWeight(.semibold)
                                }
                            })
                            
                        }
                        .padding()
                        
                        if Double(temp) ?? 0 > 0{
                            VStack{
                                HStack{
                                    Text("Principal Amount:")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.colorSet1)
                                    Spacer()
                                    Text("\(amount)")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.colorSet1)
                                }
                                .padding()
                                
                                HStack{
                                    Text("Interest Amount:")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.colorSet1)
                                    Spacer()
                                    Text("\(temp)")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.colorSet1)
                                }
                                .padding()
                                
                                HStack{
                                    Text("Total Amount:")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.colorSet1)
                                    Spacer()
                                    Text("\(finalAmount)")
                                        .font(.system(size: 20))
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.colorSet1)
                                }
                                .padding()
                            }
                        }
                        else{
                            Text("Please enter the details")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                                .foregroundStyle(.colorSet1)
                        }
                        
                    }
                }
                .navigationTitle("Compound Interest Calculator")
                .foregroundStyle(.colorSet1)
                .navigationBarTitleDisplayMode(.inline)
            }
            
        }
    }
}

func compoundIntterest(principal: Double, interestRate: Double,  yy: Double, mm: Double, dd: Double, selectedOption: String) -> Double{
    
    let time = yy + mm/12 + dd/365
    var result: Double
    let rateOfInterest = interestRate/100
    
    if selectedOption == "Monthly"{
        let compoundFactor = pow((1 + rateOfInterest/12), 12*time)
        result = principal*compoundFactor
    }
    
    else if selectedOption == "Quartely"{
        let compoundFactor = pow((1 + rateOfInterest/4), 4*time)
        result = principal*compoundFactor
    }
    
    else if selectedOption == "Half Yearly"{
        let compoundFactor = pow((1 + rateOfInterest/2), 2*time)
        result = principal*compoundFactor
    }
    
    else if selectedOption == "Yearly"{
        let compoundFactor = pow((1 + rateOfInterest/1), 1*time)
        result = principal*compoundFactor
    }
    
    else {
        result = principal
    }
    
    return result - principal
}

#Preview {
    CompountInterestCalculator()
}
