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

    private var box: Box = .EMPTY
    private var visible = false
    private var boxStale = false
    private var visibleStale = false

    init(window: NSWindow) {
        self.window = window
    }

    func setBox(box: Box) {
        boxStale = self.box != box
        self.box = box
    }

    func setVisible(visible: Bool) {
        visibleStale = self.visible != visible
        self.visible = visible
    }

    func draw(widthRatio: Double, heightRatio: Double, offsetY: Double) {
        if boxStale {
            boxStale = false
            window.setFrame(NSRect(
                x: box.x * widthRatio,
                y: (Config.baseHeight - box.y - box.height) * heightRatio + offsetY,
                width: box.width * widthRatio,
                height: box.height * heightRatio
            ), display: false, animate: false)
        }

        if visibleStale {
            visibleStale = false
            window.setIsVisible(visible)
        }
    }
}
