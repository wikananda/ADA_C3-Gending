//
//  CategoryCard.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct CategoryCard: View {

    var category: String
    var img: UIImage?
    var body: some View {
        NavigationLink(destination: CategoryDetailView(category: category)) {
            ZStack (alignment: .bottomLeading) {
                Image(uiImage: img ?? .dummy)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 175, height: 125)
                
                LinearGradient(
                    gradient: Gradient(colors: [.clear, Color.black.opacity(0.7)]),
                    startPoint: .center,
                    endPoint: .bottom
                )
                
                Text(category)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .padding([.leading, .bottom], 15)
            }
            .frame(width: 175, height: 125)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white.opacity(0.5), lineWidth: 0.5)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CategoryCard(category: "Artist")
}
