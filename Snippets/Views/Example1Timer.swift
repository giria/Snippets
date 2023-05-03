//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

struct Example1Timer: View {
    
    let url = URL(string: "https://example.com")!
    @State private var message = "Loading..."
    
    var body: some View {
        Text(message)
            .task {
                do {
                    var receivedLines = [String]()
                    for try await line in url.lines {
                        receivedLines.append(line)
                        try await Task.sleep(nanoseconds: 1_000_000_000)
                        message = "Received \(receivedLines.count) lines"
                    }
                } catch {
                    message = "Failed to load"
                }
            }
        
    }
}

struct Example1Timer_Previews: PreviewProvider {
    static var previews: some View {
        Example1Timer()
    }
}
