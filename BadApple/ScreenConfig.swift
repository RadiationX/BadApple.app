//
//  ScreenConfig.swift
//  BadApple
//
//  Created by RadiationX on 21.07.2024.
//

import Cocoa
import Foundation

class ScreenConfig {
    let widthRatio: Double
    let heightRatio: Double
    let offsetY: Double
    init(screen: NSScreen) {
        let frams = screen.visibleFrame
        widthRatio = Double(frams.width) / Config.baseWidth
        heightRatio = Double(frams.height) / Config.baseHeight
        offsetY = frams.origin.y
    }
}
