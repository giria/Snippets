//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

struct Overlay: View {
    var body: some View {
        Rectangle()
            .fill(Color.blue)
            .overlay(
                Image(systemName: "xmark")
                    .frame(width: 62, height: 62)
                    .foregroundColor(Color.white)
                    .background(Circle().stroke().colorInvert())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding()
            )
            .overlay(
                Image(systemName: "xmark")
                    .frame(width: 62, height: 62)
                    .foregroundColor(Color.red)
                    .background(Circle().stroke().foregroundColor(Color.yellow))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding()
            )
    }
}

struct Overlay_Previews: PreviewProvider {
    static var previews: some View {
        Overlay()
    }
}
