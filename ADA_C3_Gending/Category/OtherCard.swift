//
//  OtherCard.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//

import SwiftUI

struct OtherCard: View {
    var title: String = "Other Title"
    
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
            Text(title)
                .font(.custom("Urbanist", size: 16))
                .fontWeight(.bold)
                .foregroundColor(.text1)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.text1)
        }
//        .padding()
//        .background(Color.gray)
    }
}

#Preview {
    OtherCard()
}
