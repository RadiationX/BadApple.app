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
    let boxesPath: String
    let musicPath: String

    init(speed: Double, shadows: Bool, maxBoxes: Int, boxesPath: String, musicPath: String) {
        self.speed = speed
        self.shadows = shadows
        self.maxBoxes = maxBoxes
        self.boxesPath = boxesPath
        self.musicPath = musicPath
    }
}
