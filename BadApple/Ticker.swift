//
//  Ticker.swift
//  BadApple
//
//  Created by RadiationX on 19.07.2024.
//

import Foundation

class Ticker {
    private let tickTimeNs: UInt64

    private let initialNs: UInt64 = DispatchTime.now().uptimeNanoseconds

    init(tps: UInt) {
        let tickTimeMs = 1000.0 / Double(tps)
        self.tickTimeNs = UInt64(tickTimeMs * 1000000.0)
    }

    func ticks() -> Int {
        let nowNs = DispatchTime.now().uptimeNanoseconds
        let diff = nowNs - initialNs
        return Int(diff / tickTimeNs)
    }
}
