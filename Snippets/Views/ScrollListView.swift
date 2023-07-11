//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI


struct ScrollListView: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Button("Scroll to Bottom") {
                    withAnimation {
                        proxy.scrollTo(0)
                    }
                }
                .id(1)
                
                
                VStack(spacing: 0) {
                    ForEach(0..<100) { i in
                        color(fraction: Double(i) / 100)
                            .frame(height: 32)
                    }
                }
                
                
                Button("Top") {
                    withAnimation {
                        proxy.scrollTo(1)
                    }
                }
                .id(0)
            }.scrollIndicators(.visible)
        }
    }
}


func color(fraction: Double) -> Color {
    Color(red: fraction, green: 1 - fraction, blue: 0.5)
}

struct ScrollListView_ScrollListView: PreviewProvider {
    static var previews: some View {
        ScrollListView()
    }
}
