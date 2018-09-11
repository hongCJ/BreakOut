//
//  Paddle.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/10.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import SpriteKit

class Paddle: SKShapeNode {
    override init() {
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: PaddleConfig.width, height: PaddleConfig.height)).cgPath
        fillColor = PaddleConfig.color

        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: PaddleConfig.width, height: PaddleConfig.height))
        physicsBody?.restitution = 1.0
        physicsBody?.friction = 0.0
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = PaddleConfig.category

        name = PaddleConfig.name
    }
}
