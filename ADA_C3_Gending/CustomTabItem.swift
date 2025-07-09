//
//  MainTabView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedIndex: Int
    
    var body: some View {
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
}

struct CustomTabItem: View {
    let iconName: String
    let title: String
    let index: Int
    
    @Binding var selectedIndex: Int
    
    private var isSelected: Bool {
        selectedIndex == index
    }
    
    var body: some View {
        Button(action: {
            self.selectedIndex = index
        }) {
            VStack(spacing: 4) {
                Image(systemName: iconName)
                    .font(.system(size: 24))
                
                Text(title)
                    .font(.system(size: 10))
            }
        }
        .foregroundColor(isSelected ? .white : .gray)
    }
}

#Preview {
    @State var selectedIndex = 0
    CustomTabBar(selectedIndex: $selectedIndex)
}
