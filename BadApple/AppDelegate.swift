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

    private var audioPlayer: AVAudioPlayer!

    init(config: Config) {
        self.config = config
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let screen = NSScreen.main!.visibleFrame
        let widthRatio = Double(screen.width) / Config.baseWidth
        let heightRatio = Double(screen.height) / Config.baseHeight

        var windows: [BoxWindow] = []
        for _ in 0 ... min(config.maxBoxes, 155) {
            windows.append(createWindow(config: config))
        }

        audioPlayer = playMusic(config: config)

        Task {
            let offsetY = screen.origin.y
            try await FrameRunner.run(config: config) { frame in
                let lastFrameIndex = frame.count - 1

                for index in 0 ..< windows.count {
                    let window = windows[index]
                    let visible = index <= lastFrameIndex
                    window.setVisible(visible: visible)
                    if visible {
                        window.setBox(box: frame[index])
                    }
                    window.draw(widthRatio: widthRatio, heightRatio: heightRatio, offsetY: offsetY)
                }
            }
            NSApplication.shared.terminate(nil)
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {}

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }

    private func createWindow(config: Config) -> BoxWindow {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 0, height: 0),
            styleMask: [.closable, .titled],
            backing: .buffered,
            defer: true
        )
        window.titleVisibility = .hidden
        window.titlebarAppearsTransparent = true
        window.backgroundColor = NSColor.white
        window.hasShadow = config.shadows

        return BoxWindow(window: window)
    }

    func playMusic(config: Config) -> AVAudioPlayer? {
        do {
            let laudioURL = URL(fileURLWithPath: config.musicPath)
            let audioPlayer = try AVAudioPlayer(contentsOf: laudioURL, fileTypeHint: AVFileType.mp3.rawValue)
            audioPlayer.rate = Float(config.speed)
            audioPlayer.enableRate = config.speed != 1.0
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            return audioPlayer
        } catch {
            print("audio error \(error)")
        }
        return nil
    }
}
