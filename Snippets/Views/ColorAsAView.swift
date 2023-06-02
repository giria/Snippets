//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

struct ColorAsAView: View {
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            Color.blue.frame(width: 100, height: 100)
        }
    }
}

struct ColorAsAView_Previews: PreviewProvider {
    static var previews: some View {
        ColorAsAView()
    }
}
