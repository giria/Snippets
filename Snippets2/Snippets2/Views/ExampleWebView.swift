//Created for Snippets2 in 2023
// Using Swift 5.0

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        
        let request = URLRequest(url: getURL()! )
        webView.load(request)
    }
    
    public func getURL() -> URL? {
        guard let url: URL = Bundle.main.url(forResource: "doc.rtfd.zip", withExtension: nil) else { return nil }
        return url
    }
}





struct ExampleWebView: View {
   
    
    var body: some View {
        VStack {
            
                WebView( )
                
                    .ignoresSafeArea()
                    .navigationTitle("RTF View")
                    .navigationBarTitleDisplayMode(.inline)
           
            Spacer()
        }
    }
    
   
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
       ExampleWebView()
    }
}
