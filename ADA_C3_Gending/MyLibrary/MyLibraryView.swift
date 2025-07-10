//
//  MyLibraryView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct MyLibraryView : View {
    @State var selectedIndex: Int = 2
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                LibraryTabButton(title: "Recordings", index: 0, selectedTab: $selectedIndex)
                Spacer()
                LibraryTabButton(title: "Playlists", index: 1, selectedTab: $selectedIndex)
                Spacer()
                LibraryTabButton(title: "Artists", index: 2, selectedTab: $selectedIndex)
            }
            .padding(3)
            .background(.accent.opacity(0.25))
            .cornerRadius(10)
            .padding()
            
            ScrollView {
                switch selectedIndex {
                    case 0:
                        FavoritesLibraryView()
                    case 1:
                        LibraryPlaylistView()
                    default:
                        LibraryArtistView()
                }
            }
        }
        .background(.dark2)
    }
}

// MARK: TAB VIEW
struct LibraryArtistView: View {
    let songIndices = Array(0...5)
    var body: some View {
        ForEach(songIndices.indices, id: \.self) { index in
            LibraryArtistCard()
                .padding(.horizontal)
                .padding(.vertical, 5)
            
            if index != songIndices.count - 1 {
                Divider()
                    .background(Color.white.opacity(0.5))
            }
        }
    }
}

struct FavoritesLibraryView: View {
    let songIndices = Array(0...5)
    
    var body: some View {
        ForEach(songIndices.indices, id: \.self) { index in
            FullSongCard()
                .padding(.horizontal)
                .padding(.vertical, 5)
            
            if index != songIndices.count - 1 {
                Divider()
                    .background(Color.white.opacity(0.5))
            }
        }
    }
}

struct LibraryPlaylistView: View {
    let songIndices = Array(0...5)
    
    var body: some View {
        ForEach(songIndices.indices, id: \.self) { index in
            LibraryPlaylistCard()
                .padding(.horizontal)
                .padding(.vertical, 5)
            
            if index != songIndices.count - 1 {
                Divider()
                    .background(Color.white.opacity(0.5))
            }
        }
    }
}

// MARK: CUSTOM COMPONENTS
struct LibraryArtistCard: View {
    let name: String = "I Wayan Beratha"
    let titles = ["Composer", "Gong Kebyar"]
    var body: some View {
        HStack (spacing: 25){
            Image(.dummy)
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white.opacity(0.6), lineWidth: 0.5)
                )
            
            VStack (alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.custom("Urbanist", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.text1)
                
                HStack (alignment: .center, spacing: 5) {
                    ForEach(titles.indices, id: \.self) { index in
                        Text(titles[index])
                            .font(.custom("Urbanist", size: 16))
                            .fontWeight(.regular)
                            .foregroundColor(.text1)
                        
                        if index < titles.count - 1 {
                            Text("|")
                                .font(.custom("Urbanist", size: 16))
                                .fontWeight(.regular)
                                .foregroundColor(.text1)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct LibraryPlaylistCard: View {
    var title: String = "Ayuning"
    var desc: String = "Gamelan Pesel"
    var count: Int = 10
    
    var body: some View {
        HStack(spacing: 20) {
            Image(.dummy)
                .resizable()
                .frame(width: 65, height: 65)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white.opacity(0.6), lineWidth: 0.5)
                )
            VStack (alignment: .leading, spacing: 5) {
                Text(title)
                    .font(.custom("Urbanist", size: 16))
                    .fontWeight(.bold)
                    .foregroundColor(.text1)
                HStack (alignment: .center, spacing: 3) {
                    Text(desc)
                        .font(.custom("Urbanist", size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.text1)
                    Text("•")
                        .font(.custom("Urbanist", size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(.text1)
                    Text("\(count) songs")
                        .font(.custom("Urbanist", size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.text1)
                }
                
            }
            
            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.text1)
        }
    }
}

struct LibraryTabButton: View {
    let title: String
    let index: Int
    @Binding var selectedTab: Int
    
    var isSelected: Bool {
        selectedTab == index
    }
    
    var body: some View {
        Button(action: { selectedTab = index }) {
            Text(title)
                .font(.custom("Urbanist", size: 16))
                .fontWeight(isSelected ? .bold : .medium)
                .foregroundColor(.text1)
                .padding(.vertical, 7)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .background(isSelected ? .accent : .clear)
                .cornerRadius(10)
        }
    }
}

#Preview {
    MyLibraryView()
}
