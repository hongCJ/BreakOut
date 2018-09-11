//
//  GameScene.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/10.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector.init(dx: 0, dy: -5)
        physicsWorld.contactDelegate = self
        
        physicsBody = SKPhysicsBody.init(edgeLoopFrom: self.frame)
        
        let paddle = Paddle.init()
        paddle.position = CGPoint.init(x: 0, y: PaddleConfig.height + 20)
        addChild(paddle)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
//            let location = touch.location(in: self)
            var location = CGPoint.zero
            let ball = Ball.init()
            ball.position = location
            addChild(ball)
            
            addBlock()
        }
    }
    
    private func addBlock() {
        let block = Block.init()
        block.position = .zero
        addChild(block)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        print("cll")
    }
}
