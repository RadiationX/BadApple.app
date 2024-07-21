//
//  Box.swift
//  BadApple
//
//  Created by RadiationX on 19.07.2024.
//

import Foundation

class Box: Equatable {
    static let EMPTY = Box(x: 0.0, y: 0.0, width: 0.0, height: 0.0)

    let x: Double
    let y: Double
    let width: Double
    let height: Double

    init(x: Double, y: Double, width: Double, height: Double) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
    }

    public static func ==(b1: Box, b2: Box) -> Bool {
        return
            b1.x == b2.x &&
            b1.y == b2.y &&
            b1.width == b2.width &&
            b1.height == b2.height
    }
}
