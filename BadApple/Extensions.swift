//
//  Extensions.swift
//  BadApple
//
//  Created by RadiationX on 19.07.2024.
//

import Foundation

extension Duration {
    var inMilliseconds: Double {
        let v = components
        return Double(v.seconds) * 1000 + Double(v.attoseconds) * 1e-15
    }
}

extension Double {
    func round(to places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
