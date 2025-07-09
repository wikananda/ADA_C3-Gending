//
//  ExploreView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct ExploreView : View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    ForEach(1...10, id: \.self) { i in
                        SongCard()
                    }
                }
                .padding(.horizontal)
            }
            .background(.dark1)
        }
        .navigationTitle(Text("Trending"))
    }
}

#Preview {
    ExploreView()
}
