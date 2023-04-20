import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.requestReview) var requestReview    
    var body: some View {
        ZStack {
            VStack {
                NavigationStack {
                    List {
                        // About View
                        NavigationLink { AboutView() } label: {
                            Text("🧐 About Todoify")
                        }
                        // Feedback Hyperlink (Email)
                        Link("✉️ Give Feedback", destination: URL(string: "mailto:mail@tekbyte.net")!)
                        
                        
                        // Review prompt
                        Button("⭐️ Leave a review") {
                            requestReview()
                        }
                        
                    }
                }
            }
        }
    }
}
