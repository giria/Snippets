//Created for Snippets2 in 2023
// https://www.youtube.com/watch?v=Yh-nNdO7F50

import SwiftUI

struct ButtonStyled: View {
    @State private var moveGradient = true
    var body: some View {
        
        VStack {
            
            Text(" Continue ")
                .foregroundColor(.blue)
                .font(.largeTitle)
            
            let screenWidth = UIScreen.main.bounds.size.width
            RoundedRectangle(cornerRadius: 18,  style: .continuous)
    
                .overlay {
                    LinearGradient(colors:[.clear, .white, .clear], startPoint: .leading, endPoint: .trailing)
                        .frame(width: 450)
                        .offset(x: moveGradient ? -screenWidth / 2 : screenWidth / 2)
                }
                .animation(.linear(duration: 2).repeatForever(autoreverses: false),value: moveGradient)
            
                .mask {
                    Text(" Continue ")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                }
                .frame( width: 250, height: 50)
               
               
                .onAppear(){
                    self.moveGradient.toggle()
                }.padding()
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 15,style: .continuous))
            
            
        }
        
    }
}

struct ButtonStyled_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyled()
    }
}
