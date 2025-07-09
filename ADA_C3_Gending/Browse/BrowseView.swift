//
//  BrowseView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct BrowseView : View {
    @State var searchText: String = ""
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init() {
        let appearance = UISearchBar.appearance()
        appearance.searchTextField.font = UIFont(name: "Urbanist", size: 16)
        appearance.searchTextField.backgroundColor = UIColor.white
        appearance.searchTextField.textColor = UIColor.white
        appearance.tintColor = UIColor.white
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    CategoryCard(category: "Composer")
                    CategoryCard(category: "Sanggar")
                    CategoryCard(category: "Genre")
                    CategoryCard(category: "Instruments")
                    CategoryCard(category: "Ceremony")
                    CategoryCard(category: "Performance")
                }
            }
            .padding(20)
            .background(.dark2)
        }
        .navigationTitle("Browse")
        .tint(.text1)
        .searchable(text: $searchText) {
            NavigationLink(destination: RecentSearchesView()) {
                Text("Recent Searches")
            }
        }
    }
}

#Preview {
    BrowseView()
}
