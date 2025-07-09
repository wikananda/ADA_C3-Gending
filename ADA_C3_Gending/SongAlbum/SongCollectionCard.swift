//
//  SongCollectionCar.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//


import SwiftUI

struct SongCollectionCard: View {
    @State private var isShowingSong: Bool = false
    
    var songTitle: String = "Song Title"
    var count: String = "4"
    
    var body: some View {
        Button(action: {
            isShowingSong.toggle()
        }) {
            HStack(spacing: 20) {
                Image(.dummy)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .cornerRadius(15)
                Text(songTitle)
                    .font(.custom("Urbanist", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.text1)
                
                Spacer()
                
                Text(count)
                    .font(.custom("Urbanist", size: 12))
                    .fontWeight(.regular)
                    .foregroundColor(.text1)
                Image(systemName: "chevron.right")
                    .foregroundColor(.text1)
            }
            //        .padding()
            //        .background(Color.gray)
        }
        .fullScreenCover(isPresented: $isShowingSong) {
            SongView()
        }
    }
}

#Preview {
    SongCollectionCard()
}
