//Created for Snippets2 in 2023
// Using Swift 5.0

import SwiftUI

struct SwiftUI_RTFView: View {
    
    @State var  attributedString: AttributedString
    
    
    var attr: AttributedString {
        loadRTF(from: "normalrtf")!
    }
    
    var body: some View {
        VStack {
            Text(attr)
            //Spacer()
        }
    }
    
    
    
    public func loadRTF(from resource: String) -> AttributedString? {
        
        var nsAttributedString: NSAttributedString = NSAttributedString()
        
        guard let rtfdDirectoryURL = Bundle.main.url(forResource: resource, withExtension: "rtfd") else { return nil }
        
        
        
        let options = [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.rtfd]
        do {
            nsAttributedString = try NSAttributedString(url: rtfdDirectoryURL, options: options, documentAttributes: nil)
            
        } catch {
            print("\(error.localizedDescription)")
        }
        
        return AttributedString(nsAttributedString)
        
        
        
        
    }
}

struct SwiftUI_RTFView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUI_RTFView(attributedString: "jj")
    }
}
