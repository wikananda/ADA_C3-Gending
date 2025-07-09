//
//  SongView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 08/07/25.
//

import SwiftUI

struct InstrumentView : View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ZStack(alignment: .bottomLeading) {
                        Image(.dummy)
                            .resizable()
                            .frame(minHeight: 350)
                            .aspectRatio(contentMode: .fill)
                        
                        
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, Color.black.opacity(0.75)]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        
                        VStack(alignment: .leading, spacing: 50) {
                            VStack (alignment: .leading) {
                                Text("Gender Wayang")
                                    .font(.custom("Urbanist", size: 32))
                                    .foregroundColor(.text1)
                                    .fontWeight(.bold)
                                Text("Instrument")
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
                        Text("See More")
                            .font(.custom("Urbanist", size: 16))
                            .foregroundColor(.text1)
                            .fontWeight(.bold)
                    }
                    .padding()
                    
                    VStack (alignment: .leading, spacing: 20) {
                        Text("Song's Related")
                            .font(.custom("Urbanist", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.text1)
                        ForEach(0...3, id: \.self) { i in
                            SongCollectionCard()
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    VStack (alignment: .leading, spacing: 20) {
                        Text("Other Instrument")
                            .font(.custom("Urbanist", size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.text1)
                        ForEach(0...3, id: \.self) { i in
                            OtherCard(title: "Instrument")
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
    InstrumentView()
}
