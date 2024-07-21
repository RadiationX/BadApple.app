//
//  FramesReader.swift
//  BadApple
//
//  Created by RadiationX on 21.07.2024.
//

import Foundation

class FramesReader {
    static func getFrames(config: Config) throws -> [Frame] {
        let handle = try FileHandle(forReadingFrom: config.boxesUrl)
        var frames: [Frame] = []
        var temp: [Box] = []
        while true {
            guard let data = try handle.read(upToCount: 4) else {
                break
            }
            let x = Double(data[0])
            let y = Double(data[1])
            let width = Double(data[2])
            let height = Double(data[3])
            if x == 0.0, y == 0.0, width == 0.0, height == 0.0 {
                frames.append(Frame(boxes: temp.prefix(config.maxBoxes).map { $0 }))
                temp.removeAll()
            } else {
                temp.append(Box(x: x, y: y, width: width, height: height))
            }
        }
        temp.removeAll()
        try handle.close()
        return frames
    }
}
