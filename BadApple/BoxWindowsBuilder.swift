//
//  BoxWindows.swift
//  BadApple
//
//  Created by RadiationX on 21.07.2024.
//

import Cocoa
import Foundation

class BoxWindowsBuilder {
    static func createAll(config: Config, screenConfig: ScreenConfig) -> [BoxWindow] {
        var windows: [BoxWindow] = []
        for _ in 0 ... min(config.maxBoxes, 155) {
            windows.append(createWindow(config: config, screenConfig: screenConfig))
        }
        return windows
    }

    private static func createWindow(config: Config, screenConfig: ScreenConfig) -> BoxWindow {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 0, height: 0),
            styleMask: [.closable, .titled],
            backing: .buffered,
            defer: true
        )
        if config.withTitle {
            window.title = "Bad Apple"
            window.titleVisibility = .visible
        } else {
            window.titleVisibility = .hidden
        }

        window.titlebarAppearsTransparent = true
        window.backgroundColor = NSColor.white
        window.hasShadow = config.shadows
        window.contentView = nil

        return BoxWindow(window: window, screenConfig: screenConfig)
    }
}
