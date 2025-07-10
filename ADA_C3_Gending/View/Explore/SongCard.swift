//
//  SongCard.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI



struct SongCard: View {
    var song: Song
    var body: some View {
        VStack (alignment: .center) {
            HStack (spacing: 25) {
                Image(song.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white.opacity(0.6), lineWidth: 0.5)
                    )
                VStack (alignment: .leading) {
                    Text(song.title)
                        .font(.custom("Urbanist", size: 16))
                        .fontWeight(.bold)
                    Text(song.performedBy)
                        .font(.custom("Urbanist", size: 12))
                        .fontWeight(.bold)
                    Spacer()
                    HStack {
                        SongTag("performance")
                        SongTag("rindik")
                    }
                }
                .foregroundColor(.text1)
                
                Spacer()
                
                Image(systemName: "play.circle.fill")
                    .font(.system(size: 36))
                    .foregroundColor(.text1)
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 75)
        .padding()
//        .padding(.horizontal)
//        .background(Color.black.opacity(0.2))
        .cornerRadius(10)
    }
    
}

struct SongTag: View {
    var tag: String
    
    // So we don't have to specify tag when initialize
    // SongTag("the tag"), not SongTag(tag: "the tag")
    init(_ tag: String) {
        self.tag = tag
    }
    
    var body: some View {
        Text(tag)
            .font(.custom("Urbanist",size:10))
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(.primaryRed)
            .foregroundColor(.text1)
            .fontWeight(.medium)
            .cornerRadius(20)
    }
}

#Preview {
    SongCard(song: Song.dummySongs[0])
}
