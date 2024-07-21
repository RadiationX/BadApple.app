//
//  AudioPlayer.swift
//  BadApple
//
//  Created by RadiationX on 21.07.2024.
//

import AVFoundation
import Foundation

class AudioPlayer {
    static func playMusic(config: Config) -> AVAudioPlayer? {
        do {
            let audioPlayer = try AVAudioPlayer(contentsOf: config.musicUrl, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer.rate = Float(config.speed)
            audioPlayer.enableRate = config.speed != 1.0
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            return audioPlayer
        } catch {
            print("Audio error \(error)")
        }
        return nil
    }
}
