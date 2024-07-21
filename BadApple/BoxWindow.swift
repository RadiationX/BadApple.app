//
//  BoxWindow.swift
//  BadApple
//
//  Created by RadiationX on 19.07.2024.
//

import Cocoa
import Foundation

class BoxWindow {
    private let window: NSWindow
    private let screenConfig: ScreenConfig

    private var box: Box = .EMPTY
    private var visible = false
    private var boxStale = false
    private var visibleStale = false

    init(window: NSWindow, screenConfig: ScreenConfig) {
        self.window = window
        self.screenConfig = screenConfig
    }

    func setBox(box: Box) {
        boxStale = self.box != box
        self.box = box
    }

    func setVisible(visible: Bool) {
        visibleStale = self.visible != visible
        self.visible = visible
    }

    func draw() {
        if boxStale {
            boxStale = false
            window.setFrame(NSRect(
                x: box.x * screenConfig.widthRatio,
                y: (Config.baseHeight - box.y - box.height) * screenConfig.heightRatio + screenConfig.offsetY,
                width: box.width * screenConfig.widthRatio,
                height: box.height * screenConfig.heightRatio
            ), display: false, animate: false)
        }

        if visibleStale {
            visibleStale = false
            window.setIsVisible(visible)
        }
    }
}
