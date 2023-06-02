//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI


enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}






struct ThemePickerView: View {
    @State private var selectedFlavor: Flavor = .chocolate

    
    var body: some View {
        List {
            Picker("Flavor", selection: $selectedFlavor) {
                Text("Chocolate").tag(Flavor.chocolate)
                Text("Vanilla").tag(Flavor.vanilla)
                Text("Strawberry").tag(Flavor.strawberry)
            }
        }
        .pickerStyle(.inline)
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView( )
    }
}

