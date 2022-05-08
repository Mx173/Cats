//
//  Cats_App.swift
//  Cats!
//
//  Created by Oleh Pazynich on 2022/04/22.
//

import SwiftUI

@main
struct Cats_App: App {
    @StateObject private var catsVM = CatsViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                CatsView()
                    .tabItem {
                    Label("CATS!", systemImage: "list.dash")
                }
                
                SwipeView()
                    .tabItem {
                        Label("Vote!", systemImage: "heart")
                    }
            }
            .task {
                await catsVM.GetCats()
            }
            .environmentObject(catsVM)
        }
    }
}
