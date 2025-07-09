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
        ZStack (alignment: .bottomLeading) {
            Image(uiImage: img ?? .dummy)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 175, height: 175)
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, Color.black.opacity(0.7)]),
                startPoint: .center,
                endPoint: .bottom
            )
            
            Text(category)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .padding([.leading, .bottom], 15)
            
//            Color.black.opacity(0.4)
            
//            Text(category)
//                .font(.system(size: 32, weight: .bold))
//                .foregroundColor(.white)
                
        }
        .frame(width: 175, height: 175)
        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .padding(20)
    }
}

#Preview {
    CategoryCard(category: "Artist")
}
