/* FILE = OnelistApp.swift
 AUTHOR = Berk Dogan
 PROJECT = Onelist
 URL = https://github.com/berkiyo/compoundify
 */

import SwiftUI

@main
struct TodoifyApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    // the body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .environmentObject(listViewModel)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
