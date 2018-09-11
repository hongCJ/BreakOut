//
//  Block.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/11.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import SpriteKit

class Block: SKShapeNode {
    override init() {
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: BlockConfig.width, height: BlockConfig.height)).cgPath

        fillColor = BlockConfig.color
        lineWidth = 0
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: BlockConfig.width, height: BlockConfig.height))
        physicsBody?.categoryBitMask = BlockConfig.category
        physicsBody?.categoryBitMask = BallConfig.category
    }
}
