//
//  AppDelegate.swift
//  test_shadows
//
//  Created by RadiationX on 02.06.2023.
//

import AVFAudio
import AVFoundation
import AVKit
import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    private let config: Config

    private var audioPlayer: AVAudioPlayer?

    init(config: Config) {
        self.config = config
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let screenConfig = ScreenConfig(screen: NSScreen.main!)
        let windows = BoxWindowsBuilder.createAll(config: config, screenConfig: screenConfig)
        let frames = try! FramesReader.getFrames(config: config)
        // needs save reference
        audioPlayer = AudioPlayer.playMusic(config: config)

        Task {
            try await FrameRunner.run(frames: frames, config: config) { frame in
                let lastFrameIndex = frame.count() - 1

                for index in 0 ..< windows.count {
                    let window = windows[index]
                    let visible = index <= lastFrameIndex
                    window.setVisible(visible: visible)
                    if visible {
                        window.setBox(box: frame.getBox(index: index))
                    }
                    window.draw()
                }
            }
            NSApplication.shared.terminate(nil)
        }
    }
}
