import SwiftUI

struct HomePage: View {
    
    @State private var selectedSection: SectionType = .all
    @EnvironmentObject var colorThemeManager: ColorThemeManager
    
    enum SectionType: String{
        case unitConversion = "UnitConversion"
        case finances = "Finances"
        case computer = "Computer"
        case all = "All"
    }
    
    var body: some View {
        NavigationStack{
                ZStack{
                    LinearGradient(colors: colorThemeManager.gradientColors(),
                                   startPoint: .topTrailing,
                                   endPoint: .bottom)
                    .ignoresSafeArea()
                    
                    VStack{
                        Text("Swiftly Convert")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundStyle(.fontColor1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15){
                                Button("All"){
                                    withAnimation {
                                        selectedSection = .all
                                    }
                                }
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.fontColor1)
                                .padding()
                                .padding(.horizontal)
                                .background(
                                    selectedSection == .all ? .fontColor2.opacity(0.7) : .fontColor1.opacity(0.1)
                                )
                                .cornerRadius(30)
                                
                                Button("Unit Conversion"){
                                    withAnimation {
                                        selectedSection = .unitConversion
                                    }
                                }
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.fontColor1)
                                .padding()
                                .background(
                                    selectedSection == .unitConversion ? .fontColor2.opacity(0.7) : .fontColor1.opacity(0.1)
                                )
                                .cornerRadius(30)
                                
                                Button("Finances"){
                                    withAnimation {
                                        selectedSection = .finances
                                    }
                                }
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.fontColor1)
                                .padding()
                                .background(selectedSection == .finances ? .fontColor2.opacity(0.7) : .fontColor1.opacity(0.1))
                                .cornerRadius(30)
                                
                                Button("Computer"){
                                    withAnimation {
                                        selectedSection = .computer
                                    }
                                }
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.fontColor1)
                                .padding()
                                .background(selectedSection == .computer ? .fontColor2.opacity(0.7) : .fontColor1.opacity(0.1))
                                .cornerRadius(30)
                            }
                        }
                        ScrollViewReader { proxy in
                            ScrollView(.vertical, showsIndicators: false) {
                                VStack(spacing: 15){
                                    VStack(spacing: 15){
                                        convertors(icon: "ruler-measures-supplies", feature: "Length", buttonNavigation: AnyView(LengthConvertor()))
                                        
                                        convertors(icon: "weighing-machine", feature: "Weight", buttonNavigation: AnyView(WeightConvertor()))
                                        
                                        convertors(icon: "thermometer", feature: "Temperature", buttonNavigation: AnyView(TemperatureConvertor()))
                                        
                                        convertors(icon: "maximizered", feature: "Area", buttonNavigation: AnyView(AreaConvertor()))
                                        
                                        convertors(icon: "glass", feature: "Volume", buttonNavigation: AnyView(VolumeConvertor()))
                                        
                                        convertors(icon: "performance", feature: "Speed", buttonNavigation: AnyView(SpeedConvertor()))
                                    }
                                    .id(SectionType.unitConversion)
                                    
                                    VStack(spacing: 15){
                                        convertors(icon: "simpleInterest", feature: "Simple Interest", buttonNavigation: AnyView(SimpleInterestCalculator()))
                                        
                                        convertors(icon: "compound-interest", feature: "Compound Interest", buttonNavigation: AnyView(CompoundInterestCalculator()))
                                        
                                        convertors(icon: "discount", feature: "Discount", buttonNavigation: AnyView(DiscountCalculator()))
                                        
                                    }
                                    .id(SectionType.finances)
                                    
                                    VStack(spacing: 15){
                                        convertors(icon: "save", feature: "Storage", buttonNavigation: AnyView(StorageConvertor()))
                                        
                                        convertors(icon: "shared-folder", feature: "Data Transfer", buttonNavigation: AnyView(DataTransferConvertor()))
                                    }
                                    .id(SectionType.computer)
                                }
                                .id(SectionType.all)
                                .onChange(of: selectedSection) {section in
                                    withAnimation {
                                        proxy.scrollTo(section, anchor: .top)
                                    }
                                }
                                
                                VStack {
                                    HStack {
                                        Text("Made with")
                                        Image(systemName: "heart.fill")
                                    }
                                    .fontWeight(.medium)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.title3)
                                    
                                    Text("For you & me")
                                        .fontWeight(.bold)
                                        .font(.title)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .foregroundStyle(Color.gray)
                                .padding(.top)
                                
                            }
                        }
                        .padding(.top)
                    }
                    .padding(.horizontal)
                    .vTop()
                }
        }
        .tint(.fontColor1)
    }
}

struct convertors: View{
    var icon: String
    var feature: String
    var buttonNavigation: AnyView
    @State private var destinationConfirmation: Bool = false
    
    var body: some View {
        NavigationLink(destination: buttonNavigation, isActive: $destinationConfirmation) {
            
            HStack{
                Image("\(icon)")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                Text("\(feature)")
                    .foregroundStyle(.fontColor1)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Spacer()
                
                Button {
                    destinationConfirmation = true
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .foregroundStyle(.fontColor1)
                        .font(.largeTitle)
                }
                
            }
                .padding(.horizontal)
                .padding(.vertical)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundStyle(.fontColor1.opacity(0.1))
                        .shadow(color: .fontColor1.opacity(0.9), radius: 30, x: 0, y: 0)
                )
        }
    }
}

extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func vCenter() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .center)
    }
    
    func vTop() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .top)
    }
    
    func vBottom() -> some View {
        self
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    HomePage()
        .environmentObject(ColorThemeManager())
}
