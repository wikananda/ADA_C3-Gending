//
//  MainTabView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//

import SwiftUI

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
    CustomTabItem(iconName: "house", title: "Home", index: 0, selectedIndex: $selectedIndex)
}
