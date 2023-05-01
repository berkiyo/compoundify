import SwiftUI


/**
 Begin "HomeView"
 */
struct HomeView: View {
    
    @State var selection = 1 // by default, go with
    
    var body: some View {
        
        TabView(selection: $selection) {
            CompoundView()
                .tabItem {
                    Label("Calculate", systemImage: "percent")
                }
                .tag(1)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
        .navigationTitle(selection == 1 ? "Compoundify" : "Settings")
        .navigationBarTitleDisplayMode(.inline)// << here !!
        
    }
}

