//
//  FrameRunner.swift
//  BadApple
//
//  Created by RadiationX on 19.07.2024.
//

import Foundation

class FrameRunner {
    
    static func run(config: Config, frameCallback: ([Box]) async -> ()) async throws {
        let ticker = Ticker(tps: UInt(30.0 * config.speed))

        let frames = try getFrames(config: config)
        let lastFrameIndex = frames.count - 1
        var nextTick = ticker.ticks()
        var skippedFrames = 0
        while true {
            let currentTick = ticker.ticks()

            if nextTick > currentTick {
                await Task.yield()
                continue
            }
            while currentTick > nextTick {
                skippedFrames += 1
                nextTick += 1
            }
            if nextTick > lastFrameIndex {
                break
            }

            await frameCallback(frames[nextTick])

            nextTick += 1
        }
        print("skipped frames \(skippedFrames)")
    }

    private static func getFrames(config: Config) throws -> [[Box]] {
        guard let boxesURL = Bundle.main.url(forResource: "boxes", withExtension: "bin") else {
            fatalError("No boxes bundle")
        }
        let handle = try FileHandle(forReadingFrom: boxesURL)
        var frames: [[Box]] = []
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
                frames.append(temp.prefix(config.maxBoxes).map { $0 })
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
