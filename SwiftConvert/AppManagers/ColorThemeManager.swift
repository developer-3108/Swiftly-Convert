import SwiftUI

enum ColorOption: String, CaseIterable{
    case blueColorSet
    case purpleColorSet
    case pinkColorSet
    case redColorSet
    case orangeColorSet
    case yellowColorSet
    case greenColorSet
    case multiColorSet
    
    var color:Color{
        switch self{
        case .blueColorSet:
            return .blue
        case .purpleColorSet:
            return .purple
        case .pinkColorSet:
            return .pink
        case .redColorSet:
            return .red
        case .orangeColorSet:
            return .orange
        case .yellowColorSet:
            return .yellow
        case .greenColorSet:
            return .green
        case .multiColorSet:
            return .white
        default:
            return .blue
        }
    }
}

class ColorThemeManager: ObservableObject{
    @Published var selectedAccentColor: String = UserDefaults.standard.string(forKey: "selectedAccentColor") ?? "pinkColorSet"
    
    func setColor(_ color: String){
        selectedAccentColor = color
        UserDefaults.standard.set(color, forKey: "selectedAccentColor")
    }
    
    func gradientColors() -> [Color] {
        switch selectedAccentColor{
        case "blueColorSet":
            return [.blueColorSet, .blueColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        case "purpleColorSet":
            return [.purpleColorSet, .purpleColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        case "pinkColorSet":
            return [.pinkColorSet, .pinkColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        case "redColorSet":
            return [.redColorSet, .redColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        case "orangeColorSet":
            return [.orangeColorSet, .orangeColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        case "yellowColorSet":
            return [.yellowColorSet, .yellowColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        case "greenColorSet":
            return [.greenColorSet, .greenColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        case "multiColorSet":
            return [.blueColorSet, .purpleColorSet, .pinkColorSet, .redColorSet, .orangeColorSet, .yellowColorSet, .greenColorSet]
        default:
            return [.purpleColorSet, .purpleColorSet.opacity(0.2), .gradientSet1, .gradientSet1]
        }
    }
    
}

