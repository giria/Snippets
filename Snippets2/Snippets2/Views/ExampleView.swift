//Created for Snippets2 in 2023
// Using Swift 5.0

import SwiftUI


struct ExampleView: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            
            Text (" First Text")
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            
            if showDetails {
                Text("Details go here.")
            }
            
            Text (" Third Text")
            Spacer()
        }
    }
}

struct ExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ReorderingGrid()
    }
}

