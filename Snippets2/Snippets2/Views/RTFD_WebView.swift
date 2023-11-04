//Created for Snippets2 in 2023
// Using Swift 5.0


import SwiftUI
import WebKit

struct RTFWebView: UIViewRepresentable {
    // 1
    let url: URL
    
    
    // 2
    func makeUIView(context: Context) -> WKWebView {
        
        return WKWebView()
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

struct RTFD_WebView: View {
    
    var body: some View {
        NavigationStack {
            // 3
            RTFWebView(url: URL(string: "https://instantmirage.com")!)
            
                .ignoresSafeArea()
                .navigationTitle("Joan")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RTFD_WebView_Previews: PreviewProvider {
    static var previews: some View {
        RTFD_WebView()
    }
}
