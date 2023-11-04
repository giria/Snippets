//Created for Snippets2 in 2023
// Using Swift 5.0

import SwiftUI

struct Draggable: View {
    let sports = ["figure.badminton", "figure.cricket", "figure.fencing"]
    @State private var dropImage = Image(systemName: "photo")
    
    var body: some View {
        VStack {
            HStack {
                ForEach(sports, id: \.self) { sport in
                    Image(systemName: sport)
                        .frame(minWidth: 50, minHeight: 50)
                        .background(.red)
                        .foregroundStyle(.white)
                        .draggable(Image(systemName: sport)){
                            Label("Figure playing golf", systemImage: "figure.golf")
                        }
                }
            }
            .frame(minWidth: 300, minHeight: 70)
            .background(.gray)
            
            dropImage
                .frame(width: 150, height: 150)
                .background(.green)
                .foregroundStyle(.white)
                .dropDestination(for: Image.self) { items, location in
                    dropImage = items.first ?? Image(systemName: "photo")
                    return true
                }
        }
    }
}

struct Draggable_Previews: PreviewProvider {
    static var previews: some View {
        Draggable()
    }
}
