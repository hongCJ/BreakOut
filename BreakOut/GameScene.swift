//
//  GameScene.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/10.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import GameplayKit
import SpriteKit

class GameScene: SKScene {
    override func didMove(to _: SKView) {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        addPaddle()
        addBlock()
        addBall()
    }

    private func addPaddle() {
        let paddle = Paddle()
        paddle.position = CGPoint(x: PaddleConfig.width, y: SceneConfig.height - 50).toSceneCoordinate()
        addChild(paddle)
    }

    private func addBlock() {
        let marginLeft = (SceneConfig.width - CGFloat(GameConfig.column) * (BlockConfig.width + 5.0) - 5.0) / 2
        let marginTop: CGFloat = 40.0
        for i in 0 ..< GameConfig.row {
            for j in 0 ..< GameConfig.column {
                let block = Block()
                let x = CGFloat(j) * (BlockConfig.width + 5.0) + marginLeft + BlockConfig.width / 2
                let y = CGFloat(i) * (BlockConfig.height + 5.0) + marginTop + BlockConfig.height / 2
                block.position = CGPoint(x: x, y: y).toSceneCoordinate()
                addChild(block)
            }
        }
    }

    private func addBall() {
        let ball = Ball()
        ball.position = CGPoint(x: SceneConfig.width / 2, y: SceneConfig.height - 50).toSceneCoordinate()
        ball.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 10))
        addChild(ball)
    }

    private func clear() {
        removeAllChildren()
    }

    override func update(_: TimeInterval) {
        // Called before each frame is rendered
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didBegin(_: SKPhysicsContact) {
        print("cll")
    }
}
