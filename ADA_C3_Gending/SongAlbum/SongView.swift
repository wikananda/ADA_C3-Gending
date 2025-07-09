//
//  SongView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct SongView : View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ZStack(alignment:.bottom) {
                        Image(.dummy)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
    
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, Color.black.opacity(0.75)]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        
                        VStack(spacing: 50) {
                            VStack {
                                Text("Merak Angelo")
                                    .font(.custom("Urbanist", size: 32))
                                    .foregroundColor(.text1)
                                    .fontWeight(.bold)
                                Text("Lorem Ipsum")
                                    .font(.custom("Urbanist", size:16))
                                    .foregroundColor(.text1)
                            }
                            HStack(spacing: 15) {
                                Image(systemName: "play.fill")
                                    .foregroundColor(.text1)
                                    .fontWeight(.medium)
                                Text("Play")
                                    .font(.custom("Urbanist", size: 16))
                                    .foregroundColor(.text1)
                                    .fontWeight(.semibold)
                            }
                            .padding(15)
                            .frame(maxWidth: 250)
                            .background(.primaryRed)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        .padding(.bottom, 30)
                    }
                    .frame(minHeight: 500)
                    
                    VStack (alignment: .leading) {
                        Text("Popular Recording")
                            .font(.custom("Urbanist", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.text1)
                        ForEach(0...2, id: \.self) { i in
                            PopularRecordingCard()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    VStack (alignment: .leading, spacing: 20) {
                        Text("Song's Related")
                            .font(.custom("Urbanist", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.text1)
                        ForEach(0...7, id: \.self) { i in
                            SongCollectionCard()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            }
            .ignoresSafeArea(edges: .top)
            .background(.dark1)
        }
    }
}

#Preview {
    SongView()
}
