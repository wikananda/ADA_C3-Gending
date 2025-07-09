//
//  SongView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct SongView : View {
    @Environment(\.dismiss) var dismiss
    @State private var isExpanded: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    ZStack(alignment: .bottomLeading) {
                        Image(.dummy)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(minHeight: 500)

                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.8)]),
                            startPoint: .top,
                            endPoint: .bottom
                        )

                        VStack(alignment: .center, spacing: 12) {
                            Text("Merak Angelo")
                                .font(.custom("Urbanist", size: 32))
                                .fontWeight(.bold)
                            VStack(alignment: .center) {
                                Text("Music in this context is created as a sacred offering to gods and ancestors. It's deeply spiritual and performed during temple festival...")
                                    .font(.custom("Urbanist", size: 16))
                                    .fontWeight(.regular)
                                    // Use lineLimit to show more/less text
                                    .lineLimit(isExpanded ? nil : 2)
                                    .multilineTextAlignment(.center)
                                
                                // "see more" button
                                Button(action: {
                                    withAnimation {
                                        isExpanded.toggle()
                                    }
                                }) {
                                    Text(isExpanded ? "see less" : "see more")
                                        .font(.custom("Urbanist", size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(.text1.opacity(0.8))
                                }
                            }
                            
                            Spacer().frame(height: 10)
                            Button(action: {  }) {
                                HStack {
                                    Spacer()
                                    Image(systemName: "play.fill")
                                    Text("Play")
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                .padding(.vertical, 12)
                                .background(.primaryRed)
                                .frame(width: 350)
                                .cornerRadius(10)
                            }
                        }
                        .foregroundColor(.text1)
                        .padding()
                        .padding(.bottom, 20)
                        
                        VStack {
                            HStack {
                                Button(action: { dismiss() }) {
                                    Image(systemName: "chevron.left")
                                        .font(.title2.weight(.semibold))
                                        .padding()
                                        .background(.black.opacity(0.3))
                                        .foregroundColor(.white)
                                        .clipShape(Circle())
                                }
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding()
                    }
//                    .frame(maxHeight: 500)
                    
                    VStack (alignment: .leading) {
                        Text("Popular Recordings")
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
            .background(.dark1)
            .ignoresSafeArea(edges: .top)
        }
    }
}

#Preview {
    SongView()
}
