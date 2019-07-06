//
//  PlayerFactory.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 4/11/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class PlayerFactory {
  static func createPlayer(at startPosition: CGPoint, name: String, color: NSColor, actions: Dictionary<UInt16, String>, arena: GKEntity) -> GKEntity {
    let player = GKEntity()

    let playerRadius: CGFloat = 50
    let playerShape: SKShapeNode = SKShapeNode(circleOfRadius: playerRadius)
    playerShape.name = name
    playerShape.fillColor = color
    playerShape.position = startPosition
    playerShape.zPosition = 1.0
    let baseMovementAcceleration = 100
    let playerPhysicsBody = SKPhysicsBody.init(circleOfRadius: playerRadius)
    playerPhysicsBody.affectedByGravity = false
    playerShape.physicsBody = playerPhysicsBody

    player.addComponent(VisibleShapeComponent(withVisibleShape: playerShape))
    player.addComponent(InputMovementComponent(with: playerPhysicsBody, baseMovementAcceleration: baseMovementAcceleration, inputDirections: actions))
    player.addComponent(LossTrackingComponent(withTargetShape: arena.component(ofType: VisibleShapeComponent.self)!.visibleShape, targeterShape: playerShape))

    return player
  }
}
