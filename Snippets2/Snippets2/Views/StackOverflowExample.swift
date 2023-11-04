//Created for Snippets2 in 2023
// Using Swift 5.0

import SwiftUI

import SwiftUI
struct StackOverflowExample: View {
 //   var body: some View {
//        VStack(spacing: 0) {
//            ScrollView(.horizontal) {
//                HStack{ForEach(0 ..< 10, id: \.self) {Text("Item\($0)")}}
//            }
//            Image(systemName: "clock").resizable()
//                .padding(.top, -50).frame(height: 50)
//                .contentShape(Rectangle())
//                .clipped()
//                .allowsHitTesting(false)
//        }
        
     
            @State private var images = [Image]()
            let columns = [GridItem(.fixed(100)), GridItem(.fixed(100))]
            
            var body: some View {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0..<images.count, id: \.self) { index in
                            images[index]
                                .resizable()
                                .frame(width: 100, height: 100)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(maxHeight: 350)
                
                Button("Add 10 Stars") {
                    for _ in 1...10 {
                        images.append(Image(systemName: "star"))
                    }
                }
                .buttonStyle(.bordered)
            }
//            Image("viking")
//                .resizable()
//               // .offset(x:100,y:100)
//                .scaledToFit()
//                .frame(width: 200, height: 200,alignment: .center)
//                .border(Color.pink,width: 5)
//               // .mask(Rectangle().edgesIgnoringSafeArea(.top))
//                .clipped()
                
        

}

struct StackOverflowExample_Previews: PreviewProvider {
    static var previews: some View {
        StackOverflowExample()
    }
}
