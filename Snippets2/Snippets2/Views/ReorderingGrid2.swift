///Created for Snippets2 in 2023
// Using Swift 5.0






import SwiftUI
import ConfettiSwiftUI


struct ImageModel: Identifiable, Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    let id = UUID()
    let image: Image
    let imageName:String
}



struct ReorderingGrid2: View {
    // View properties
    //    @State private var images: [UIImage] = [ UIImage(named: "cell_1_1")!,  UIImage(named: "cell_1_2")!,  UIImage(named: "cell_1_3")!,  UIImage(named: "cell_2_1")!,  UIImage(named: "cell_2_2")!,  UIImage(named: "cell_2_3")!,  UIImage(named: "cell_3_1")!,  UIImage(named: "cell_3_2")!,  UIImage(named: "cell_3_4")]
    
    
    let texts: [String] = [
        """
        1/1 A short marriage

Anne was married to Henry VIII for just six months, making it one of the shortest royal marriages in English history.

Their marriage was annulled, ostensibly because it was never consummated. Anne agreed to the annulment, which helped her avoid the tragic fates of some of Henry’s other wives.

After the annulment, Anne was given the title of “the King’s Sister” and enjoyed a friendly relationship with Henry and his children, including attending official functions.

Anne received a generous divorce settlement, including Hever Castle, the childhood home of Henry VIII’s second wife, Anne Boleyn.
""", """

                         2/2 The portrait

The portrait was painted by Hans Holbein, one of the most skilled portraitists of his time.
The point of the picture was to give Henry as close an idea of the woman's appearance as possible. This would explain the frontal position, in which every detail of the face can be examined.
So is most likely an accurate portrayal of Anne of Cleves.

Why the king divorced  from Anne? There are different versions of what really succeded:

The most repeated version is that Henry's displeasure at finding Anne of Cleves more like a `fat flanders mare' when she arrived for the marriage ceremony in January 1540. This cost Holbein dear in prestige, and he received no further important work from this quarter.

Acccording another version Henry VIII had a habit of dressing as a commoner and traveling around England to have a good time. When Anne of Cleves was traveling to England for the wedding, Henry VIII decided to have a little fun and see her a bit early. Henry VIII managed to wade through the crowd and plant a  kiss on Anne. The soon-to-be Queen revolted in disgust, and that was enough to let Henry VIII know that he was no longer the strapping, handsome man he used to be when he ascended to the throne at age 17. He was now an aging and obese king that was quickly closing in on 50.


Belying her appearance, Anne of Cleves was no fool. Despite - or because of - the evident humiliation of the failed marriage she obtained a handsome settlement from Henry and lived in quiet comfort in England until 1555. Henry's two subsequent wives were English.
""",
   """
                 3/3 No heirs

Anne of Cleves never had children. She also never remarried after her divorce from Henry VIII. She and Catherine Howard (who was only 18 or 19 when she was killed) were the only two wives of Henry VIII who never had any children.

                ===  🔵  ===
""" ]
    
    @State private var jigsawVisible = false
    @State private var buttonShuffleVisible = false
    @State private var textIsVisible = false
    @State private var counter: Int = 0
    @State private var secretIndex = 0
    @State private var imageModels: [ImageModel] = [ ImageModel(image: Image("Anne/" + "cell_1_1"),imageName:"1_1") ,
                                                     ImageModel(image: Image("Anne/" + "cell_1_2"),imageName:"1_2"),
                                                     ImageModel(image: Image("Anne/" + "cell_1_3"),imageName: "1_3"),
                                                     ImageModel(image: Image("Anne/" + "cell_2_1"), imageName: "2_1")  ,
                                                     ImageModel(image: Image("Anne/" + "cell_2_2"), imageName: "2_2"),
                                                     ImageModel(image: Image("Anne/" + "cell_2_3"), imageName: "2_3"),
                                                     ImageModel(image: Image("Anne/" + "cell_3_1"), imageName: "3_1"),
                                                     ImageModel(image: Image("Anne/" + "cell_3_2"), imageName: "3_2"),
                                                     ImageModel(image: Image("Anne/" + "cell_3_3"), imageName: "3_3") ]
    @State private var draggingItem: ImageModel?
    
    var names: [String] = [ "cell_1_1","cell_1_2","cell_1_3","cell_2_1","cell_2_2","cell_2_3","cell_3_1","cell_3_2","cell_3_3"]
    
    
    
    
    var body: some View {
        
        
        let threeColumnGrid = [
            GridItem(.fixed(80), spacing: 1),
            GridItem(.fixed(80), spacing: 1),
            GridItem(.fixed(80), spacing: 1),  //.flexible(minimum: 10)
        ]
        
        VStack{
            
            Text("Anne of Cleves, the fourth wife of Henry the VIII")
                .foregroundColor(.red)
                .bold()
                .fontWeight(.regular)
                .kerning(0.4)
                .accentColor(.yellow)
            
            
            //Image("Landsend")
            if (!jigsawVisible) {
                Image("Anne/Portrait_Anne")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .topLeading)
                    .border(.blue)
                
                
                
                
                Button() {
                    jigsawVisible = true
                    buttonShuffleVisible = true
                    
                } label: { Text(" Learn more")
                }.buttonStyle(.borderedProminent)
            }
            
            
            LazyVGrid(columns: threeColumnGrid, alignment: .leading, spacing:1, content: {
                
                ForEach(imageModels ) {imageModel in
                    
                    GeometryReader {
                        let size = $0.size
                        
                        
                        
                        imageModel.image
                            .resizable()
                        // .border(.red, width: 3)
                            .aspectRatio(1, contentMode: .fit)
                        // .border(Color.black)
                        // .hoverEffect()
                        
                        //                        RoundedRectangle(cornerRadius: 10)
                        //                            .fill(color.gradient)
                        // drag
                            .draggable(imageModel.image) {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.ultraThinMaterial)
                                    .frame(width: size.width, height: size.height)
                                    .onAppear {
                                        draggingItem = imageModel
                                    }
                            }
                        // drop
                            .dropDestination(for: Image.self){ item, location in
                                print("item \(item.first! as Image) " )
                                //colors.swapAt(0,1)
                                let sourceIndex = imageModels.firstIndex(of: draggingItem!)
                                let destinationIndex = imageModels.firstIndex(of: imageModel)
                                print("sourceIndex: \(sourceIndex) ")
                                print(imageModels)
                                print(imageModels.map{$0.imageName})
                                print(" dragging name \(draggingItem!.imageName)" )
                                // print(item.)
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    imageModels.swapAt(sourceIndex!,destinationIndex!)
                                    print("source: \(sourceIndex) dest \(destinationIndex)")
                                }
                                
                                
                                
                                
                                
                                
                                print("location \(location)")
                                let current = imageModels.map{$0.imageName}
                                print(current )
                                let ordered = imageModels.sorted(by: { $0.imageName < $1.imageName } ).map {$0.imageName}
                                print(  imageModels.sorted(by: { $0.imageName < $1.imageName } ).map {$0.imageName} )
                                print( current == ordered )
                                if (current == ordered) {
                                    counter += 1
                                    textIsVisible = true
                                }
                                
                                return false
                            }isTargeted: { status in
                                print("a")
                            }
                        
                    }
                    
                }
                .frame( minHeight: 80)
                
                
            })
            .padding(30)
            .opacity(jigsawVisible ? 1: 0)
            
            if (buttonShuffleVisible) {
                Button() {
                    swapRandomValues(&imageModels)
                    //jigsawVisible.toggle()
                    buttonShuffleVisible = false
                } label: { Text(" Shuffle ")
                }.buttonStyle(.borderedProminent)
            }
            
            if ( textIsVisible == true ) {
                ScrollView (.vertical, showsIndicators: true) {
                    Text(texts[secretIndex])
                    
                    
                    if (secretIndex < texts.count - 1) {
                        Button() {
                            
                            secretIndex += 1
                            
                        } label: { Text(" More secrets, please ! ")
                        }.buttonStyle(.borderedProminent)
                    }
                    
                    
                }.frame( maxWidth: .infinity)
                    .padding()
               
            }
            
            
            
            
            
            Spacer()
            
        } .confettiCannon(counter: $counter)
            .frame( minHeight: 240)
        
        
        
    }
    func swapRandomValues<T>(_ array: inout [T]) {
        guard array.count >= 2 else {
            print("Array should have at least two elements for swapping.")
            return
        }
        
        let firstIndex = Int.random(in: 0..<array.count)
        var secondIndex = Int.random(in: 0..<array.count)
        
        while secondIndex == firstIndex {
            secondIndex = Int.random(in: 0..<array.count)
        }
        
        array.swapAt(firstIndex, secondIndex)
    }
}



struct ReorderingGrid2_Previews: PreviewProvider {
    static var previews: some View {
        ReorderingGrid2()
    }
}

