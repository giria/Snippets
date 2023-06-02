//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

struct MaxWidth: View {
    var body: some View {
        Image(systemName: "xmark")
            .frame(width: 62, height: 62)
            .background(Circle().stroke())
            .foregroundColor(Color.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding()
    }
}

struct MaxWidth_Previews: PreviewProvider {
    static var previews: some View {
        MaxWidth()
    }
}
