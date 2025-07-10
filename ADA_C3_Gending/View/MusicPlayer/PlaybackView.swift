//
//  PlaybackView.swift
//  ADA_C3_Gending
//
//  Created by Komang Wikananda on 09/07/25.
//

import SwiftUI

struct PlaybackView: View {
    @State private var songProgress: Double = 0.3
    @State private var volumeLevel: Double = 0.8
    @State private var isPlaying: Bool = false
    @State private var isDragSlider: Bool = false
    
    @ObservedObject private var audioVM: AudioViewModel = AudioViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack (alignment: .center, spacing: 20) {
                    Image(.dummy)
                        .resizable()
                        .frame(width: 375, height: 375)
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
                    
                    VStack(spacing: 4) {
                        GeometryReader { geometry in
                            ZStack {
                                Slider(value: Binding(get: {
                                    audioVM.currentTime
                                }, set: { newValue in
                                    audioVM.seek(to: newValue)
                                }), in: 0...audioVM.totalTime,
                                       onEditingChanged: { editing in
                                    isDragSlider = editing
                                })
                                .tint(.text1)
                                // Transparent overlay for detecting taps
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .contentShape(Rectangle())
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .onEnded { value in
                                                let location = value.location.x
                                                let width = geometry.size.width
                                                let percentage = max(0, min(1, location / width))
                                                let newTime = percentage * audioVM.totalTime
                                                audioVM.seek(to: newTime)
                                            }
                                    )
                            }
                        }
                        .padding(.bottom, 30)
                        HStack {
                            Text("\(formatTime(audioVM.currentTime))")
                            Spacer()
                            Text("\(formatTime(audioVM.totalTime))")
                        }
                        .font(.custom("Urbanist", size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(.text1)
                    }
                    
                    
                    HStack{
                        Button(action: { }) {
                            Image(systemName: "shuffle")
                        }
                        Spacer()
                        HStack(spacing: 40) {
                            Button(action: { }) {
                                Image(systemName: "backward.fill")
                            }
                            
                            Button(action: {
                                isPlaying.toggle()
                                if (isPlaying){
                                    audioVM.playSound(named: "Rebong", withExtension: "mp3")
                                }else{
                                    audioVM.pauseSound()
                                }
                            }) {
                                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                    .font(.system(size: 50))
                            }
                            
                            Button(action: {}) {
                                Image(systemName: "forward.fill")
                            }
                        }
                        Spacer()
                        Button(action: { }) {
                            Image(systemName: "repeat")
                        }
                    }
                    .font(.system(size: 20))
                    .foregroundColor(.text1)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
                    
                    
                    HStack {
                        Button {
                            audioVM.volume(to: 1)
                        } label: {
                            Image(systemName: "speaker.fill")
                        }.padding(.top, 10)
                        GeometryReader { geometry in
                            ZStack {
                                Slider(value: $audioVM.volumeLevel)
                                    .tint(.text1)
                                    .onChange(of: audioVM.volumeLevel) { newValue in
                                        audioVM.volume(to: newValue)
                                    }
                                // Transparent overlay for detecting taps
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .contentShape(Rectangle())
                                    .gesture(
                                        DragGesture(minimumDistance: 0)
                                            .onEnded { value in
                                                let location = value.location.x
                                                let width = geometry.size.width
                                                let percentage = max(0, min(1, location / width))
                                                let newTime = percentage * 1
                                                audioVM.volume(to: newTime)
                                            }
                                    )
                            }
                        }
                        Button {
                            audioVM.volume(to: 1)
                        } label: {
                            Image(systemName: "speaker.wave.3.fill")
                        }.padding(.top, 10)
                    }
                    .foregroundColor(.text1)
                    .font(.system(size: 16))
                    
                    Spacer()
                    
                    HStack {
                        Button(action: {}) {
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
            .onReceive(Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()) { _ in
                // Update the progress every 0.01 seconds
                if !isDragSlider {
                    updateProgress()
                }
            }
        }
        
    }
    
    
    // Format the given time interval to a string in mm:ss format
    private func formatTime(_ time: TimeInterval) -> String {
        let seconds = Int(time) % 60
        let minutes = Int(time) / 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    // Update the current time of the audio playback
    func updateProgress() {
        guard let player = audioVM.player , player.isPlaying else { return }
        audioVM.currentTime = player.currentTime  // Update the current time state
    }

}

#Preview {
    PlaybackView()
}
