//Created for Snippets2 in 2023
// Using Swift 5.0

//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI





struct ContentView: View {
    
    
    var body: some View {
        
        VStack {
            NavigationStack {
                List{
                    
                    Group {
                        
                      
                        
                        
                        
                        NavigationLink {
                           RTFView(chapter: "23",searchTerm: "complete")
                        } label: {
                            Text( " RTF to AttributeText 2")
                        }

                        NavigationLink {
                            SwiftUI_RTFView(attributedString: " ")
                        } label: {
                            Text( " RTF to AttributeText 2")
                        }

                        NavigationLink {
                           ExampleWebView()
                        } label: {
                            Text( " Example WEBVIEW")
                        }


                        NavigationLink {
                            ExampleRTFD_AttributedView()
                        } label: {
                            Text( " ExampleRTFD_AttributedView")
                        }
                        
                        NavigationLink {
                            ButtonStyled()
                        } label: {
                            Text( " Botton styled")
                        }
                        
//                        NavigationLink {
//                            ReorderingGrid()
//                        } label: {
//                            Text( " Reordering Grid")
//                        }
                        
                        NavigationLink  {
                            StackOverflowExample()
                            
                        }label : {
                            Text("Grid Add 10 stars")
                        }
                        
                        NavigationLink  {
                           Draggable()
                            
                        }label : {
                            Text("Draggable")
                        }
                        
                        NavigationLink  {
                            ReorderingGrid2()
                            
                        }label : {
                            Text("ReorderingGrid2")
                        }
                        
                        NavigationLink {
                            ExampleView()
                        }label : {
                            Text("Example View hide")
                        }
                        
                        
                        
                        
                        
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

