//
//  CategoryDetailView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 10/07/25.
//

import SwiftUI

struct CategoryDetailView: View {
    @State private var searchText = ""
    var category: String = "Artists"
    let indices = Array(1...10)
    
    private func showCards<Content: View>(
        @ViewBuilder card: @escaping () -> Content
    ) -> some View {
        ForEach(indices.indices, id: \.self) { index in
            card()
                .padding(.horizontal)
            
            if index < self.indices.count - 1 {
                Divider()
                    .background(Color.white.opacity(0.5))
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.dark2)
                        TextField("Search in All Composers", text: $searchText)
                            .tint(.dark2)
                        Image(systemName: "mic.fill")
                            .foregroundColor(.dark2)
                    }
                    .padding(5)
                    .background(.accent)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Text("Discover composers and masters who shape Balinese music, from legendary masters to contemporary talents.")
                        .font(.custom("Urbanist", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    Text("All \(category)")
                        .font(.custom("Urbanist", size: 22))
                        .fontWeight(.bold)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    VStack(spacing: 12) {
                        switch category {
                        case "Artists":
                            showCards {
                                LibraryPlaylistCard()
                            }
                        case "Periods":
                            showCards {
                                PeriodCard()
                            }
                        case "Ensemble Types":
                            showCards {
                                OtherCard(title: "Gong Kebyar")
                            }
                        case "Vibes":
                            showCards {
                                OtherCard(title: "Sacred")
                            }
                        case "Contexts":
                            showCards {
                                OtherCard(title: "Ritual & Ceremony")
                            }
                        case "Regions":
                            showCards {
                                OtherCard(title: "Buleleng")
                            }
                        default:
                            showCards {
                                AlbumCard()
                            }
                        }
                    }
                }
//                .padding()
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.large)
            .background(.dark2)
            .preferredColorScheme(.dark)
        }
    }
}

struct AlbumCard: View {
    var title: String = "Gong Kebyar, Vol. I (2023)"
    var author: String = "Bali Gamelan Sound — “Gong ISI Denpasar” ensemble"
    
    var body: some View {
        HStack(spacing: 20) {
            Image(.dummy)
                .resizable()
                .frame(width: 65, height: 65)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.text1.opacity(0.5), lineWidth: 0.5)
                )
            VStack (alignment: .leading) {
                Text(title)
                    .font(.custom("Urbanist", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.text1)
                Text(author)
                    .font(.custom("Urbanist", size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(.text1)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.text1)
        }
    }
}

struct PeriodCard: View {
    var title: String = "Majapahit Legacy Period"
    var period: String = "(14th - 17th century)"
    
    var body: some View {
        HStack(spacing: 20) {
            Image(.dummy)
                .resizable()
                .frame(width: 65, height: 65)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.text1.opacity(0.5), lineWidth: 0.5)
                )
            VStack (alignment: .leading) {
                Text(title)
                    .font(.custom("Urbanist", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.text1)
                Text(period)
                    .font(.custom("Urbanist", size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(.text1)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.text1)
        }
    }
}

#Preview {
    CategoryDetailView(category: "Albums")
}
