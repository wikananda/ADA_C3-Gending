//
//  ContentView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 03/07/25.
//

import SwiftUI

struct SuaragamView: View {
    @State private var selectedIndex: Int = 0
    
    var body: some View {
        ZStack (alignment: .bottom) {
            VStack {
                switch selectedIndex {
                case 0:
                    ExploreView()
                case 1:
                    BrowseView()
                default:
                    MyLibraryView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.dark2)
            .foregroundColor(.text1)
            
            // Custom tab bar
            HStack (alignment: .center) {
                CustomTabItem(iconName: "house", title: "Home", index: 0, selectedIndex: $selectedIndex)
                Spacer()
                CustomTabItem(iconName: "magnifyingglass", title: "Search", index: 1, selectedIndex: $selectedIndex)
                Spacer()
                CustomTabItem(iconName: "rectangle.stack", title: "My Library", index: 2, selectedIndex: $selectedIndex)
            }
//            .padding(.top, 20)
            .padding(.horizontal, 50)
            .frame(height: 80)
//            .background(.dark1)
            // Glassmorphism custom tab bar
            .background {
                ZStack {
                    Rectangle()
                        .foregroundStyle(.ultraThinMaterial)
                    Rectangle()
                        .foregroundStyle(.dark2.opacity(0.5))
                }
            }
            .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: -5)
            // add white line on top of tab bar
            .overlay(
                Rectangle()
                    .frame(height: 0.5)
                    .foregroundColor(.text1.opacity(0.3)),
                alignment: .top
            )
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SuaragamView()
}
