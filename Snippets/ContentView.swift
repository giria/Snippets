//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                NavigationLink {
                    Example1Timer()
                } label: {
                    Text("Tap me.Example 1 Timer")
                }
                
                NavigationLink {
                    Example1Timer()
                } label: {
                    Text("Tap me.Example 1 Timer")
                }
                
                
                
            }
            
            
          
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
