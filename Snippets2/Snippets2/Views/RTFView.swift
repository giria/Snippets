//Created for Snippets2 in 2023
// Using Swift 5.0

import SwiftUI
import UIKit




struct MyTextView: UIViewRepresentable {
    @Binding var text: NSMutableAttributedString
    var searchText:String
    
    func makeUIView(context: Context) -> UITextView {
        UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
       // uiView.attributedText = getNSAttributedString(rtf: "23", searchTerm: searchText)
        uiView.attributedText = text
        //adjust the scroll to make visible the first search term
        if let string = uiView.text, let range = string.localizedStandardRange(of: searchText) {
            let viewRange = NSRange(range, in: string)
          
            
            uiView.selectedRange = viewRange // optional
            uiView.isScrollEnabled = true
            uiView.scrollRangeToVisible(viewRange)
            uiView.scrollRangeToVisible(uiView.selectedRange)
                    
        }
    }
}

struct RTFView: View {
    
    @State var text = NSMutableAttributedString(string: "")
    var chapter: String
    var searchTerm:String
    var body: some View {
        VStack {
            
            
            Text("header")
            MyTextView(text: $text, searchText: searchTerm)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 600)
                .background(.blue)
                .border(.red)
                .scrollIndicators(.visible)
            Spacer()
            
        }.task {
            
            text = getNSAttributedString(rtf: chapter , searchTerm: searchTerm)
            
            
        }
    }
    
    public func loadRTF(from resource: String) -> NSMutableAttributedString? {
        guard let url = Bundle.main.url(forResource: resource, withExtension: "rtf") else { return nil }
        
        guard let data = try? Data(contentsOf: url) else { return nil }
        
        return try? NSMutableAttributedString(data: data,
                                              options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtf],
                                              documentAttributes: nil)
    }
    
    
    func  getNSAttributedString (rtf: String, searchTerm: String) -> NSMutableAttributedString {
        
         let attrStr =  loadRTF(from: rtf)!
        
       
        
        // Find the range of each element to modify.
        let inputLength = attrStr.string.count
        
        let searchLength = searchTerm.count
        var range = NSRange(location: 0, length: attrStr.length)
        
        while (range.location != NSNotFound) {
            range = (attrStr.string as NSString).range(of: searchTerm, options: [], range: range)
            if (range.location != NSNotFound) {
                attrStr.addAttribute(NSAttributedString.Key.backgroundColor, value: UIColor.yellow, range: NSRange(location: range.location, length: searchLength))
                range = NSRange(location: range.location + range.length, length: inputLength - (range.location + range.length))
            }
        }
        
        return attrStr
    }
}

struct RTFView_Previews: PreviewProvider {
    static var previews: some View {
        RTFView(chapter: "23", searchTerm: "origin")
    }
}
