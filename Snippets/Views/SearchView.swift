//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

struct SearchView: View {
    
    @FocusState private var isFocused: Bool
    @State private var searchTerm = ""
    @State private var text:AttributedString = """
  


The legality of using copyrighted material to train AI is still very contentious and there has not yet been
a precedent case that can be used to determine the validity of either side of the case.
Currently, Getty is suing Stability AI for its role in supporting the development of LAION,
which includes over 12 million photographs from Getty Images’ collection. Many artists have also been vocal
against the use of their images to train AI. Karla Ortiz, an artist and board member of an advocacy organization
for artists called the Concept Art Association, is leading a fundraising campaign to hire a lobbyist
in Washington D.C. Ortiz and the organization hope to bring changes to US copyright, data privacy,
and labor laws to protect artists’ intellectual property.

Artists should theoretically already be able to remove their work from the training dataset, according to Stability AI,
 which announced in December that it would honor all opt-out requests collected from the Have I Been Trained? website.
 There is also a section on the LAION website’s FAQ that states EU citizens who find their images and other identifiable
 data in the dataset are eligible to file a claim for their personal data to be taken down under the GDPR law.



 Ed sheran
"""

    var body: some View {
        //
        let binding = Binding(
            get: { self.searchTerm },
            set: {
                self.searchTerm = $0
                print($0)
                // Add call to API here
                text = getAttributedString(search: searchTerm)
            }
        )
        //
        
        
        VStack {
            HStack {
                
                ZStack(alignment: .trailing) {
                    TextField("search t", text:binding, prompt: Text("search Term"), axis: .vertical)
                    
                        .focused($isFocused)
                        .padding(20)
                        .border(.primary)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .textFieldStyle(.roundedBorder)
                        .onSubmit {
                            text = getAttributedString(search: searchTerm)
                        }
                        .onAppear(){
                            isFocused = true
                            UITextField.appearance().clearButtonMode = .whileEditing
                        }
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            searchTerm = ""
                            text.backgroundColor = .white
                        }.padding()
                    
                }
                
                Button() {
                    //
                    print("here")
                    text = getAttributedString(search: searchTerm)
                    
                }label: {
                    Text("Search")
                }
                Spacer()
                
            }
            ScrollView(.vertical, showsIndicators: true) {
                Text(text)
                    .foregroundColor(.primary)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .lineLimit(30)
                    .lineSpacing(1.0)
            }
            
            
            
            
            
            Spacer()
        }
    }
    
    
    func  getAttributedString (search: String) -> AttributedString {
        // clear attributes
       
        text.backgroundColor = .white
        
        var searchRange = text.startIndex..<text.endIndex
        while let range = self.text[searchRange].range(of: search, options: .caseInsensitive,locale: Locale.current) {
            print("here")
            text[range].backgroundColor = .yellow
            searchRange = range.upperBound..<searchRange.upperBound
        }
        
        return text
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
