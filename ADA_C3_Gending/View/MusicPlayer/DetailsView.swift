//
//  DetailsView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//

import SwiftUI

struct DetailsView: View {
    @State var selectedTab: Int = 0
    var body: some View {
        VStack (alignment:. leading, spacing: 50){
            HStack (alignment: .top) {
                VStack (alignment: .leading, spacing: 25){
                    InfoRow(label: "Name", value: "Merak Angelo")
                    InfoRow(label: "Author", value: "I Nyoman Bandem")
                    InfoRow(label: "Year", value: "2022")
                    
                    VStack (alignment: .leading, spacing: 10) {
                        Text("Tag")
                            .font(.custom("Urbanist", size: 20))
                            .fontWeight(.bold)
                        HStack {
                            SongTag("Magical")
                        }
                    }
                    .foregroundColor(.text1)
                }
                
                Spacer()
                
                Image(.dummy)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .cornerRadius(30)
                
            }
            
            VStack(alignment: .leading) {
                HStack (spacing: 25) {
                    TabButton(title: "Story", index: 0, selectedTab: $selectedTab)
                    TabButton(title: "Similar Song", index: 1, selectedTab: $selectedTab)
                }
                
                ScrollView {
                    switch selectedTab {
                    case 0:
                        StoryDetailsView()
                    default:
                        Text("Similar Song")
                    }
                }
        
            }
        }
        .background(.dark2)
    }
}

// MARK: TAB VIEWS
struct StoryDetailsView: View {
    let stories: String = "Lorem ipsum dolor sit amet consectetur. Venenatis placerat mauris lacus sit felis bibendum in tortor. Duis ultrices ut aliquam duis at. Dictum sit scelerisque egestas morbi mi. Gravida molestie accumsan elit ullamcorpe.\n\n Cursus urna porttitor euismod non magnis. Eu vel dictumst morbi viverra. Euismod varius nullam curabitur ante ante. Eu euismod turpis curabitur sit egestas convallis. Risus porttitor a praesent nibh tortor adipiscing posuere. Bibendum nulla et odio ullamcorper consequat ipsum vitae pulvinar. Lectus semper ut aliquet condimentum eu. Blandit bibendum id egestas ut egestas vel tortor metus.\n\nVelit ornare quam magnis ultrices. Tortor mattis rhoncus egestas sagittis. Fermentum vulputate at gravida sit cursus velit pulvinar velit interdum. Sit condimentum quisque duis id. Vitae vel urna pretium purus netus sem tortor donec. Vestibulum pellentesque vitae auctor at nisl cras aliquam sed. Rhoncus in tincidunt maecenas vitae condimentum pharetra consequat enim. Turpis at volutpat quis cras tempus amet. Nam habitasse ut purus mi. Cursus integer semper et lectus luctus vitae diam convallis."
    
    var body: some View {
        Group {
            Text(stories)
        }
        .font(.custom("Urbanist", size: 16))
        .fontWeight(.medium)
        .foregroundColor(.text1)
    }
}

// MARK: CUSTOM COMPONENT

struct TabButton: View {
    let title: String
    let index: Int
    @Binding var selectedTab: Int
    
    var isSelected: Bool {
        selectedTab == index
    }
    
    var body: some View {
        Button(action: { selectedTab = index }) {
            Text(title)
                .font(.custom("Urbanist", size: 20))
                .fontWeight(.bold)
                .padding(.vertical, 10)
//                .padding(.horizontal, 12)
//                .background(isSelected ? Color.gray.opacity(0.4) : Color.clear)
                .foregroundColor(isSelected ? .text1 : .text1.opacity(0.5))
//                .clipShape(Capsule())
                .overlay(
                    Rectangle()
                        .frame(height: isSelected ? 5 : 0)
                        .foregroundColor(.primaryRed),
                    alignment: .top
                )
        }
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            Text(label)
                .font(.custom("Urbanist", size: 20))
                .fontWeight(.bold)
            Text(value)
                .font(.custom("Urbanist", size: 16))
                .fontWeight(.medium)
                .underline(color: .text1)
        }
        .foregroundColor(.text1)
    }
}

#Preview {
    DetailsView()
}
