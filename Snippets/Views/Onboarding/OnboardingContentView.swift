//Created for Snippets in 2023
// Using Swift 5.0



import SwiftUI

let features = [
    Feature(title: "What is the 'Life in UK' test?", subtitle: "Also known as the British Citizenship test, the Life in UK test is used to verify that applicants have the adequate knowledge of British customs, traditions, laws and political system, as required under the UK's immigration rules.", image: "test"),
    Feature(title: "How to pass?", subtitle: "You will have to answer 24 multiple choice questions about British customs, traditions, laws and the political system. You have to answer at least 18 questions correctly to pass – a pass mark of 75%.", image: "sea"),
    Feature(title: "It is easy?", subtitle: "Committing 7 or more mistakes in the exam means you would fail. If there are a couple of questions that you aren't sure about, but you are confident of you answers for the rest, then do not panic!", image: "hammock"),
    Feature(title: "Pass rate", subtitle: "Across the UK, 170,986 tests were taken in 2018/19, with 18 per cent of people failing, or 31,559 in total. ", image: "pass"),
    
    Feature(title: "Get the book", subtitle: "Get sure you got the last edition of the **Life in the UK** - last edition is the 2023 edition. You can get the book at the official shop: https://www.officiallifeintheuk.co.uk/shop . After reading the book, practice with our app in order to solidify your knowledge and adquire confidence.", image: "book"),
    
    Feature(title: "How much", subtitle: "You need to take the test as part of your application for British citizenship or settlement in the UK. You must book your Life in the UK Test online at least 3 days in advance. It costs £50. There are over 30 test centres in the UK.", image: "control"),
    
    Feature(title: "Congrats", subtitle: "If you are practicing **Life in the UK** material you are in the right path to adquire the British citizenship. Congrats on achieving such a significant milestone.",image: "congrats"),
    
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
