/* FILE = OnelistApp.swift
 AUTHOR = Berk Dogan
 PROJECT = Onelist
 URL = https://github.com/berkiyo/compoundify
 */

import SwiftUI

@main
struct CompoundifyApp: App {
    
    // the body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}
