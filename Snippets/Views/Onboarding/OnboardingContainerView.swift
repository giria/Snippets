//Created for Snippets in 2023
// Using Swift 5.0

import SwiftUI

struct OnboardingContainerView: View {
    var body: some View {
        TabView {
            ForEach(features) { feature in
                OnboardingContentView(feature: feature)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingContainerView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContainerView()
    }
}
