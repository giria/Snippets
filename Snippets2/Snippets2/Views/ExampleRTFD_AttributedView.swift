//Created for Snippets2 in 2023
// Using Swift 5.0

import SwiftUI
import WebKit

struct RTFDWebView: UIViewRepresentable {
    // 1
   // let url: URL
    
    
    // 2
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {
        
        let request = URLRequest(url: getURL()! )
        webView.load(request)
    }
    
    public func getURL() -> URL? {
        guard let url: URL = Bundle.main.url(forResource: "doc3", withExtension: "rtf") else { return nil }
        return url
    }
}

struct ExampleRTFD_AttributedView: View {
    
    var body: some View {
        NavigationStack {
            // 3
            RTFDWebView()
            
                .ignoresSafeArea()
                .navigationTitle("Joan")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}






struct ExampleRTFD_AttributedView_Previews: PreviewProvider {
    static var previews: some View {
        ExampleRTFD_AttributedView()
    }
}
