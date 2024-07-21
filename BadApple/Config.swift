//
//  Config.swift
//  BadApple
//
//  Created by RadiationX on 19.07.2024.
//

import Foundation

class Config {
    static let baseWidth = 64.0
    static let baseHeight = 48.0

    let speed: Double
    let shadows: Bool
    let maxBoxes: Int
    let boxesUrl: URL
    let musicUrl: URL

    init(speed: Double, shadows: Bool, maxBoxes: Int, boxesUrl: URL, musicUrl: URL) {
        self.speed = speed
        self.shadows = shadows
        self.maxBoxes = maxBoxes
        self.boxesUrl = boxesUrl
        self.musicUrl = musicUrl
    }
}
