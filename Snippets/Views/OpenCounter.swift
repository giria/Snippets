//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI



extension Bundle {
    public var appName: String           { getInfo("CFBundleName")  }
    public var displayName: String       { getInfo("CFBundleDisplayName")}
    public var language: String          { getInfo("CFBundleDevelopmentRegion")}
    public var identifier: String        { getInfo("CFBundleIdentifier")}
    public var copyright: String         { getInfo("NSHumanReadableCopyright").replacingOccurrences(of: "\\\\n", with: "\n") }
    
    public var appBuild: String          { getInfo("CFBundleVersion") }
    public var appVersionLong: String    { getInfo("CFBundleShortVersionString") }
    public var appVersionShort: String { getInfo("CFBundleShortVersion") }
    
    fileprivate func getInfo(_ str: String) -> String { infoDictionary?[str] as? String ?? "⚠️" }
}
struct OpenCounter: View {
    @AppStorage("openAppCount") private var openAppCount = 0
   
    
    var body: some View {
        
        Text("Welcome to my App! Openend  \(openAppCount)   times")
          
        Text("Ver: \(Bundle.main.appVersionLong ) and(\(Bundle.main.appBuild)) ")
        
        
        Text("Ver short: \(Bundle.main.appVersionShort)")
        Text(Bundle.main.copyright)
            .font(.system(size: 40, weight: .thin))
            .multilineTextAlignment(.center)
           
           
        Text( " \(openAppCount) times opened")
        
    }
}


struct OpenCounter_Previews: PreviewProvider {
    static var previews: some View {
        OpenCounter()
    }
}





