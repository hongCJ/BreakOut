//
//  GlobalConfig.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/10.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import UIKit

struct GameConfig {
    static let row = 5
    static let column = 10
}

struct SceneConfig {
    static let width: CGFloat = 750.0
    static let height: CGFloat = 1334.0
}

struct BallConfig {
    static let color = UIColor.red
    static let radius: CGFloat = 15.0
    static let category: UInt32 = 0x1 << 1
    static let name = "ball"
}

struct BlockConfig {
    static let width: CGFloat = 60.0
    static let height: CGFloat = 30.0
    static let color = UIColor.purple
    static let category: UInt32 = 0x1 << 3
    static let name = "block"
}

struct PaddleConfig {
    static let width: CGFloat = 150.0
    static let height: CGFloat = 40.0
    static let color = UIColor.yellow
    static let category: UInt32 = 0x1 << 2
    static let name = "paddle"
}
