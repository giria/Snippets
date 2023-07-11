//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI





struct ContentView: View {
    
   // @Binding var theme:Theme
    @State private var selectedTheme: Theme = .bubblegum
    @State private var showingPopover = false
    var body: some View {
        
        VStack {
            NavigationStack {
                List{
                    NavigationLink {
                        Example1Timer()
                    } label: {
                        Text(" Timer")
                    }
                    
                    NavigationLink {
                        ThemePickerView()
                    } label: {
                        Text("Simple Picker")
                    }
                    
                    NavigationLink {
                        ThemePicker(selection: $selectedTheme)
                    } label: {
                        Text("Theme Picker")
                    }
                    
                    NavigationLink {
                        ColorAsAView()
                    } label: {
                        Text("Color As a View")
                    }
                    
                    Button("Onboarding tutorial") {
                        showingPopover = true
                    }
                    .popover(isPresented: $showingPopover) {
                        OnboardingContainerView()
                            .padding()
                    }
                    
                    NavigationLink {
                        MaxWidth()
                    } label: {
                        Text("MaxWidth and Aligment")
                    }
                    
                    
                    NavigationLink {
                        Overlay()
                    } label: {
                        Text("Overlay and aligmnentt")
                    }
                    NavigationLink {
                        OpenCounter()
                    } label: {
                        Text("Number of times app opened")
                    }
                    
                    NavigationLink {
                        ScrollListView()
                    } label: {
                        Text("Scroll a List")
                    }
                    
                    
                   
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
