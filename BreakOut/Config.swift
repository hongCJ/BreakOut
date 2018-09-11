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
    static let column = 15
}

struct SceneConfig {
    static let width = 750
    static let height = 1334
}

struct BallConfig {
    static let color = UIColor.red
    static let radius: CGFloat = 15.0
    static let category: UInt32 = 0x1 << 1
}

struct BlockConfig {
    static let width: CGFloat = 40.0
    static let height: CGFloat = 20.0
    static let color = UIColor.purple
    static let category: UInt32 = 0x1 << 3
}

struct PaddleConfig {
    static let width: CGFloat = 100.0
    static let height: CGFloat = 40.0
    static let color = UIColor.yellow
    static let category: UInt32 = 0x1 << 2
}
