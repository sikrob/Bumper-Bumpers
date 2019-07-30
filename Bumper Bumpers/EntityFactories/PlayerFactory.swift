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
  static func createPlayer(at startPosition: CGPoint, playerId: Int, color: NSColor, actions: Dictionary<UInt16, String>, arena: GKEntity) -> GKEntity {
    let player = GKEntity()

    let playerRadius: CGFloat = 50

    let playerSprite: SKSpriteNode = SKSpriteNode(imageNamed: playerId == 1 ? "Player1.png" : "Player2.png")
    playerSprite.name = playerId == 1 ? "Ameoblue" : "Amoered"
    playerSprite.position = startPosition
    playerSprite.zPosition = 1.0

    let baseMovementAcceleration = 200
    let playerPhysicsBody = SKPhysicsBody.init(circleOfRadius: playerRadius)
    playerPhysicsBody.affectedByGravity = false
    playerSprite.physicsBody = playerPhysicsBody

    player.addComponent(SpritesComponent(withSprites: [playerSprite]))
    player.addComponent(InputMovementComponent(with: playerPhysicsBody, baseMovementAcceleration: baseMovementAcceleration, inputDirections: actions))
    player.addComponent(LossTrackingComponent(withTarget: arena.component(ofType: VisibleShapeComponent.self)!.visibleShape, targeter: playerSprite))

    return player
  }
}
