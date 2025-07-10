//
//  ExploreView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct ExploreView : View {
    let songIndices = Array(1...10)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 5) {
                    ForEach(songIndices.indices, id: \.self) { index in
                        SongCard()
                            .padding(.horizontal)
                        
                        // adding divider
                        if index != songIndices.count - 1 {
                            Divider()
//                                .frame(height: 0.5)
                                .background(Color.white.opacity(0.5))
                        }
                    }
                }
            }
            .background(.dark2)
        }
        .tint(.text1)
        .navigationTitle(Text("Trending"))
    }
}

#Preview {
    ExploreView()
}
