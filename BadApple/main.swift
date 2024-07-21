//
//  main.swift
//  BadApple
//
//  Created by RadiationX on 18.07.2024.
//

import Cocoa
import Foundation

let config = Config(
    speed: 1.0,
    shadows: true,
    maxBoxes: 200,
    boxesPath: "/Users/radiationx/boxes.bin",
    musicPath: "/Users/radiationx/bad_apple.mp3"
)
let delegate = AppDelegate(config: config)
NSApplication.shared.delegate = delegate
_ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
