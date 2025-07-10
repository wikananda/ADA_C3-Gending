//
//  SongView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct VibesView : View {
    @State private var isExpanded: Bool = false
    
    var title: String = "Tranquil"
    var subtitle: String = "Vibes"
    
    let indices = Array(1...5)
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ZStack(alignment: .bottomLeading) {
                        Image(.dummy)
                            .resizable()
                            .frame(minHeight: 300)
                            .aspectRatio(contentMode: .fill)
                        
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, Color.black.opacity(0.75)]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        
                        VStack(alignment: .leading, spacing: 50) {
                            VStack (alignment: .leading) {
                                Text(title)
                                    .font(.custom("Urbanist", size: 24))
                                    .foregroundColor(.text1)
                                    .fontWeight(.bold)
                                Text(subtitle)
                                    .font(.custom("Urbanist", size:16))
                                    .foregroundColor(.text1)
                            }
                        }
                        .padding()
                        .padding(.bottom)
                    }
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Lorem ipsum dolor sit amet consectetur. Ullamcorper nibh varius ac accumsan. Tincidunt nulla id nulla tellus sem amet senectus. Amet massa sem curabitur cursus consectetur habitant...")
                            .font(.custom("Urbanist", size: 16))
                            .foregroundColor(.text1)
                            .lineLimit(isExpanded ? nil : 3)
                        Button(action: {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }) {
                            Text(isExpanded ? "See less" :"See more")
                                .font(.custom("Urbanist", size: 16))
                                .foregroundColor(.text1)
                                .fontWeight(.bold)
                        }
                    }
                    .padding()
                    
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Related Recordings")
                            .font(.custom("Urbanist", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.text1)
                            .padding(.horizontal)
                        ForEach(indices.indices, id: \.self) { i in
                            FullSongCard()
                                .padding(.horizontal)
                            
                            if i != indices.count - 1 {
                                Divider()
                                    .background(Color.white.opacity(0.5))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack (alignment: .leading, spacing: 12) {
                        Text("Other \(subtitle)")
                            .font(.custom("Urbanist", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.text1)
                            .padding(.horizontal)
                        ForEach(indices.indices, id: \.self) { i in
                            OtherCard(title: "Other \(subtitle)")
                                .padding(.horizontal)
                            
                            if i != indices.count - 1 {
                                Divider()
                                    .background(Color.white.opacity(0.5))
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .background(.dark2)
        }
    }
}

#Preview {
    VibesView()
}
