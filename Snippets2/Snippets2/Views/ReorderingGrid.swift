//Created for Snippets2 in 2023
// Using Swift 5.0
// https://www.youtube.com/watch?v=UFiOCcm6zTo

import SwiftUI

struct ReorderingGrid: View {
    // View properties
    @State private var colors: [Color] = [ .red, .blue, .purple, .yellow, .black, .indigo, .cyan, .brown, .mint]
    @State private var draggingItem: Color?
    var body: some View {
        ScrollView(.vertical){
            let columns = Array(repeating: GridItem(spacing: 10), count: 3)
            Text("Your content")
                .frame(maxWidth: .infinity, minHeight: 100)
                .foregroundStyle(.white)
                .background(.red.gradient)
            LazyVGrid(columns: columns, spacing:10, content: {
                
                ForEach(colors, id: \.self) {color in
                    GeometryReader {
                        let size = $0.size
                        
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(color.gradient)
                        // drag
                            .draggable(color) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: size.width, height: size.height)
                                    .onAppear {
                                        draggingItem = color
                                    }
                            }
                        // drop
                            .dropDestination(for: Color.self){ item, location in
                                print("item \(item.first! as Color) " )
                                //colors.swapAt(0,1)
                                let sourceIndex = colors.firstIndex(of: draggingItem!)
                                let destinationIndex = colors.firstIndex(of: color)
                                print("sourceIndex: \(sourceIndex) ")
                                withAnimation(.easeIn){
                                  //  let sourceItem = colors.remove(at: sourceIndex!)
                                  //  colors.insert(sourceItem, at: destinationIndex!)
                                    colors.swapAt(sourceIndex!,destinationIndex!)
                                    print("source: \(sourceIndex) dest \(destinationIndex)")
                                }
                                
                                
//                                if let sourceIndex = colors.firstIndex(of: item.first!), let destinationIndex = colors.firstIndex(of: color) {
//                                    print("source: \(sourceIndex) dest \(destinationIndex)")
//                                    withAnimation(.easeIn){
//                                         let sourceItem = colors.remove(at: sourceIndex)
//                                         colors.insert(sourceItem, at: destinationIndex)
//                                        colors.swapAt(1,3)
//                                        print("source: \(sourceIndex) dest \(destinationIndex)")
//                                    }
//                                }
                                
                                
                                
                                print("location \(location)")
                                return false
                            }isTargeted: { status in
//                                if let draggingItem , status , draggingItem != color {
//
//                                    if let sourceIndex = colors.firstIndex(of: draggingItem), let destinationIndex = colors.firstIndex(of: color) {
//                                        withAnimation(.easeIn){
//                                           // let sourceItem = colors.remove(at: sourceIndex)
//                                           // colors.insert(sourceItem, at: destinationIndex)
//                                          //  colors.swapAt(sourceIndex,destinationIndex)
//                                        }
//                                    }
//                                }
                            }
//
                    }
                    
                }
                .frame(height: 100)
                
            })
            .padding(15)
        }
        .navigationTitle("Movable grid")
    }
    
}

struct ReorderingGrid_Previews: PreviewProvider {
    static var previews: some View {
        ReorderingGrid()
    }
}
