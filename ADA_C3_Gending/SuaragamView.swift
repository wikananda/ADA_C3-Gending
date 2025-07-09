//
//  ContentView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 03/07/25.
//

import SwiftUI

struct SuaragamView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "house.fill")
                }
                .tag(0)
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
                .tag(1)
            MyLibraryView()
                .tabItem {
                    Label("My Library", systemImage: "rectangle.stack")
                }
                .tag(2)
        }
    }
}

#Preview {
    SuaragamView()
}
