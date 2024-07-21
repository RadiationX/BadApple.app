//
//  Frame.swift
//  BadApple
//
//  Created by RadiationX on 21.07.2024.
//

import Foundation

class Frame {
    private let boxes: [Box]
    init(boxes: [Box]) {
        self.boxes = boxes
    }

    func count() -> Int {
        return boxes.count
    }

    func getBox(index: Int) -> Box {
        return boxes[index]
    }
}
