//
//  SimpleInterestCalculator.swift
//  SwiftlyConvert
//
//  Created by Akshat Srivastava on 13/08/24.
//

import SwiftUI

struct SimpleInterestCalculator: View {
    @State public var amount: String = ""
    @State public var interest: String = ""
    @State public var year: String = ""
    @State public var month: String = ""
    @State public var day: String = ""
    @State private var finalAmount: String = ""
    @State private var principalAmount: String = ""
    @State private var interestAmount: String = ""
    @State private var temp: String = ""
    
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                VStack{
                    VStack {
                        HStack{
                            Spacer()
                            
                            Text("Amount")
                                .foregroundStyle(.colorSet1)
                            
                            TextField("Ex: 1,00,000", text: $amount)
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
                            
                            Button(action: {
                                temp = String(format: "%.2f", (simpleInterest(principal: Double(amount) ?? 0, interestRate: Double(interest) ?? 0, yy: Double(year) ?? 0, mm: Double(month) ?? 0, dd: Double(day) ?? 0)))
                                
                                finalAmount = String(format: "%.2f", (Double(amount) ?? 0) + Double(simpleInterest(principal: Double(amount) ?? 0, interestRate: Double(interest) ?? 0, yy: Double(year) ?? 0, mm: Double(month) ?? 0, dd: Double(day) ?? 0)))
                                
                                
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
                .navigationTitle("Simple Interest Calculator")
                .foregroundStyle(.colorSet1)
                .navigationBarTitleDisplayMode(.inline)
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
}
