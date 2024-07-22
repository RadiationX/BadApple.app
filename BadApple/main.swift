//
//  main.swift
//  BadApple
//
//  Created by RadiationX on 18.07.2024.
//

import Cocoa
import Foundation

guard let musicUrl = Bundle.main.url(forResource: "bad_apple", withExtension: "mp3") else {
    fatalError("No audio bundle")
}

guard let boxesUrl = Bundle.main.url(forResource: "boxes", withExtension: "bin") else {
    fatalError("No boxes bundle")
}

let config = Config(
    speed: 1.0,
    shadows: true,
    withTitle: true,
    maxBoxes: 200,
    boxesUrl: boxesUrl,
    musicUrl: musicUrl
)
let delegate = AppDelegate(config: config)
NSApplication.shared.delegate = delegate
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
