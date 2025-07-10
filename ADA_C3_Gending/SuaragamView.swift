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
            
            // Custom Tab Bar
            CustomTabBar(selectedIndex: $selectedIndex)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SuaragamView()
}
