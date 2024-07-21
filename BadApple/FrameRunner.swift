//
//  FrameRunner.swift
//  BadApple
//
//  Created by RadiationX on 19.07.2024.
//

import Foundation

class FrameRunner {
    static func run(frames: [Frame], config: Config, frameCallback: (Frame) async -> ()) async throws {
        let ticker = Ticker(tps: UInt(30.0 * config.speed))
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
}
