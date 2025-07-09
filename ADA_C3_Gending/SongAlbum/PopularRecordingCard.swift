//
//  PopularRecordingCard.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//

import SwiftUI

struct PopularRecordingCard: View {
    @State private var isShowingPlayback: Bool = false
    
    var artist: String = "Sanggar Semara Gita"
    var year: String = "2025"
    var length: String = "3:45"
    
    var body: some View {
        Button(action: {
            isShowingPlayback.toggle()
        }) {
            HStack(spacing: 20) {
                Image(.dummy)
                    .resizable()
                    .frame(width: 65, height: 65)
                    .cornerRadius(20)
                VStack (alignment: .leading, spacing: 5) {
                    Text(artist)
                        .font(.custom("Urbanist", size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.text1)
                    HStack (alignment: .center, spacing: 3) {
                        Text(year)
                            .font(.custom("Urbanist", size: 12))
                            .fontWeight(.regular)
                            .foregroundColor(.text1)
                        Text("•")
                            .font(.custom("Urbanist", size: 12))
                            .fontWeight(.bold)
                            .foregroundColor(.text1)
                        Text(length)
                            .font(.custom("Urbanist", size: 12))
                            .fontWeight(.regular)
                            .foregroundColor(.text1)
                    }
                    
                }
                
                Spacer()
                
                Image(systemName: "ellipsis")
                    .foregroundColor(.text1)
            }
            //        .background(Color.gray)
        }
        .fullScreenCover(isPresented: $isShowingPlayback) {
            PlaybackView()
        }
    }
    
}

#Preview {
    PopularRecordingCard()
}
