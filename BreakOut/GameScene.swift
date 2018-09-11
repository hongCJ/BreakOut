//
//  GameScene.swift
//  BreakOut
//
//  Created by 郑红 on 2018/9/10.
//  Copyright © 2018 ZhengHong. All rights reserved.
//

import GameplayKit
import SpriteKit

enum GameResult {
    case win
    case lose
}

protocol GameProtocol: NSObjectProtocol {
    func GameEnd(_ result: GameResult) -> Void
}

class GameScene: SKScene {
    weak var gameDelegate: GameProtocol?

    private var playing = false

    override func didMove(to _: SKView) {
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self

        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)

        restart()
    }

    func start() {
        if let b = self.childNode(withName: BallConfig.name) {
            b.physicsBody?.applyImpulse(CGVector(dx: -10, dy: 10))
        }
    }

    func end() {
        clear()
        restart()
    }

    func pause() {
        isPaused = !isPaused
    }

    private func addBottom() {
        let bottom = SKNode()
        bottom.physicsBody = SKPhysicsBody(edgeFrom: CGPoint(x: 0, y: SceneConfig.height - 5).toSceneCoordinate(), to: CGPoint(x: SceneConfig.width, y: SceneConfig.height - 1).toSceneCoordinate())
        bottom.physicsBody?.categoryBitMask = WallConfig.category
        addChild(bottom)
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
        addChild(ball)
    }

    private func clear() {
        removeAllChildren()
    }

    private func checkWon() -> Bool {
        var count = 0
        enumerateChildNodes(withName: BlockConfig.name) { _, _ in
            count += 1
        }
        return count == 0
    }

    private func restart() {
        addPaddle()
        addBlock()
        addBall()
        addBottom()
    }

    override func update(_: TimeInterval) {
        // Called before each frame is rendered
    }

    // MARK: - Touch

    override func touchesBegan(_: Set<UITouch>, with _: UIEvent?) {
        if !playing {
            start()
            playing = true
        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with _: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        guard let paddle = childNode(withName: PaddleConfig.name) else {
            return
        }
        let preLocation = touch.previousLocation(in: self)
        let nowLocation = touch.location(in: self)

        var nextX = paddle.position.x + nowLocation.x - preLocation.x
        if fabs(nextX) > (SceneConfig.width / 2) {
            nextX = nextX > 0 ? SceneConfig.width / 2 : 0 - SceneConfig.width / 2
        }
        paddle.position.x = nextX
    }
}

extension GameScene: SKPhysicsContactDelegate {
    func didEnd(_ contact: SKPhysicsContact) {
        var ball: SKPhysicsBody?
        var other: SKPhysicsBody?

        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            ball = contact.bodyA
            other = contact.bodyB
        } else {
            ball = contact.bodyB
            other = contact.bodyA
        }

        if other?.categoryBitMask == WallConfig.category {
            clear()
            restart()
            playing = false
            gameDelegate?.GameEnd(.lose)
        } else if ball!.categoryBitMask & BallConfig.category != 0 {
            let minimalXVelocity = CGFloat(20.0)
            let minimalYVelocity = CGFloat(20.0)
            var velocity = ball!.velocity as CGVector
            if velocity.dx > -minimalXVelocity && velocity.dx <= 0 {
                velocity.dx = -minimalXVelocity - 1
            } else if velocity.dx > 0 && velocity.dx < minimalXVelocity {
                velocity.dx = minimalXVelocity + 1
            }
            if velocity.dy > -minimalYVelocity && velocity.dy <= 0 {
                velocity.dy = -minimalYVelocity - 1
            } else if velocity.dy > 0 && velocity.dy < minimalYVelocity {
                velocity.dy = minimalYVelocity + 1
            }
            ball?.velocity = velocity
        }

        if let body = other, (body.categoryBitMask & BlockConfig.category != 0) && body.categoryBitMask == BlockConfig.category {
            body.node?.removeFromParent()
            if checkWon() {
                clear()
                start()
                playing = false
            }
        }
    }
}
