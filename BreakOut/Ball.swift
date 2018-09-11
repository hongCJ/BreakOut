//
//  Ball.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/10.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import SpriteKit

class Ball: SKShapeNode {
    override init() {
        super.init()
        setUP()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUP()
    }

    private func setUP() {
        path = UIBezierPath(arcCenter: CGPoint(x: BallConfig.radius, y: BallConfig.radius), radius: BallConfig.radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true).cgPath
        fillColor = BallConfig.color
        lineWidth = 0

        physicsBody = SKPhysicsBody(circleOfRadius: BallConfig.radius)
        physicsBody?.usesPreciseCollisionDetection = true
        physicsBody?.allowsRotation = true
        physicsBody?.contactTestBitMask = PaddleConfig.category | BlockConfig.category
        physicsBody?.restitution = 1.0
        physicsBody?.friction = 0.0
        physicsBody?.linearDamping = 0

        name = BallConfig.name
    }
}
