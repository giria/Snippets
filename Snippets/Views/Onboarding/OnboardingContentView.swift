//Created for Snippets in 2023
// Using Swift 5.0



import SwiftUI

let features = [
    Feature(title: "You are in command", subtitle: "We don't disturb you with ads. We don't collect personal data. We don't ask money for premium features", image: "control"),
    Feature(title: "Simplicity", subtitle: "Enjoy a simple interface. Our goal is help you to pass the test", image: "simplicity"),
    Feature(title: "Instant feedback", subtitle: "Not sure if your guess is correct? Get instant access to the valid answer", image: "seaside")
]

struct OnboardingContentView: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    var feature: Feature
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.7041863799, green: 1, blue: 0.7746049762, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack {
                Spacer()
                Image(feature.image)
                    .resizable()
                    .scaledToFit()
                Spacer()
                
                VStack(spacing: 20) {
                    Text(feature.title)
                        .font(.system(size: 24, weight: .bold))
                    Text(feature.subtitle)
                        .font(.caption)
                }
                .padding()
                
                Spacer()
                
                Button(action: { isOnboarding = false
                    dismiss()
                }, label: {
                    Text("Skip")
                        .padding()
                        .background(
                            Capsule().strokeBorder(Color.white, lineWidth: 1.5)
                                .frame(width: 100)
                        )
                })
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingContentView(feature: features[0])
    }
}
