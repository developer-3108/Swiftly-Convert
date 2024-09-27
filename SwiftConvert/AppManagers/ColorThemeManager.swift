//
//  DarkModeManager.swift
//  SwiftConvert
//
//  Created by Akshat Srivastava on 24/09/24.
//

import SwiftUI

class ColorManager: ObservableObject{
    @Published var blueTheme: Bool = false
    @Published var purpleTheme: Bool = false
    @Published var pinkTheme: Bool = true
    @Published var redTheme: Bool = false
    @Published var orangeTheme: Bool = false
    @Published var yellowTheme: Bool = false
    @Published var greenTheme: Bool = false
}

func appColors() -> Color{
    if blueTheme == true{
        return .blueColorSet
    }
}
