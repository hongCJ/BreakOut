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
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        path = UIBezierPath.init(rect: CGRect.init(x: 0, y: 0, width: PaddleConfig.width, height: PaddleConfig.height)).cgPath
        fillColor = PaddleConfig.color
        physicsBody = SKPhysicsBody.init(rectangleOf: CGSize.init(width: PaddleConfig.width, height: PaddleConfig.height))
        
    }
}
