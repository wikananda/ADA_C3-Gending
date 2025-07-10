//
//  PlaybackView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//

import SwiftUI

struct PlaybackView: View {
    @Environment(\.dismiss) var dismiss
    @State private var songProgress: Double = 0.3
    @State private var volumeLevel: Double = 0.8
    @State private var isPlaying: Bool = true
    
    @State private var isShowingDetailsView = false
    
    var body: some View {
        ZStack {
            VStack (alignment: .center, spacing: 20) {
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "chevron.down")
                            .font(.system(size: 28))
                            .foregroundColor(.text1)
                    }
                    Spacer()
                }
                .padding()
                
                Image(.dummy)
                    .resizable()
                    .frame(width: 350, height: 350)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Merak Angelo")
                        .font(.custom("Urbanist", size: 28))
                        .fontWeight(.bold)
                        .foregroundColor(.text1)
                    Text("Semara Gita · 2025")
                        .font(.custom("Urbanist", size: 18))
                        .fontWeight(.medium)
                        .foregroundColor(.text1)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(spacing: 0) {
                    Slider(value: $songProgress)
                        .tint(.text1)
                    HStack {
                        Text("01:15")
                        Spacer()
                        Text("03:45")
                    }
                    .font(.custom("Urbanist", size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(.text1.opacity(0.75))
                }
                
                HStack(spacing: 40) {
                    Button(action: { }) {
                        Image(systemName: "backward.fill")
                    }
                    
                    Button(action: { isPlaying.toggle() }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.system(size: 50))
                    }
                    
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                }
                .font(.system(size: 20))
                .foregroundColor(.text1)
                .padding(.vertical)
                
                HStack {
                    Image(systemName: "speaker.fill")
                    Slider(value: $volumeLevel)
                        .tint(.text1)
                    Image(systemName: "speaker.wave.3.fill")
                }
                .foregroundColor(.text1)
                .font(.system(size: 16))
                
                Spacer()
                
                HStack {
                    Button(action: { isShowingDetailsView.toggle()
                    }) {
                        Image(systemName: "info.circle")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "star")
                    }
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "text.badge.plus")
                    }
                }
                .foregroundColor(.text1)
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .frame(maxWidth: 250)
            }
        }
        .padding()
        .background(.dark2)
        .sheet(isPresented: $isShowingDetailsView) {
            DetailsView()
            //                .presentationBackground(Color.clear)
                .presentationBackground(.black)
        }
    }
}

#Preview {
    PlaybackView()
}
