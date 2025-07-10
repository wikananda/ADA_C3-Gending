//
//  AudioViewModel.swift
//  ADA_C3_Gending
//
//  Created by Dwika Putra on 09/07/25.
//

import AVFoundation

class AudioViewModel:  ObservableObject{
    var player: AVAudioPlayer?
    @Published var totalTime: TimeInterval = 0.0
    @Published var currentTime: TimeInterval = 0.0
    @Published var volumeLevel: TimeInterval = 1
    
    init() {}
    
    func playSound(named fileName: String, withExtension fileExtension: String = "m4a") {
        guard let path = Bundle.main.path(forResource: "\(fileName).\(fileExtension)", ofType: nil) else {
            print("Sound file \(fileName).\(fileExtension) not found.")
            return
        }
        
        let url = URL(fileURLWithPath: path)
        
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url)
            self.player?.prepareToPlay()
            totalTime = player?.duration ?? 0.0
            self.player?.play()
            self.player?.numberOfLoops = -1
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
    
    func pauseSound() {
        player?.stop()
    }
    
    func seek(to time: TimeInterval) {
        player?.currentTime = time
        currentTime = time
    }
    
    func volume(to volume: TimeInterval) {
        player?.volume = Float(volume)
        volumeLevel = volume
    }
    
    func debugListResourcesFolder() {
        if let resourcePath = Bundle.main.resourcePath {
            let resourcesPath = resourcePath + "/Resources"
            let contents = try? FileManager.default.contentsOfDirectory(atPath: resourcesPath)
            print("📂 Contents of /Resources:", contents ?? [])
        } else {
            print("❌ Could not find main resource path.")
        }
    }

}
