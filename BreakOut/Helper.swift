//
//  Helper.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/11.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import UIKit

extension CGPoint {
    func toSceneCoordinate() -> CGPoint {
        return CGPoint(x: x - SceneConfig.width / 2, y: SceneConfig.height / 2 - y)
    }
}
