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
  static func createPlayer(at startPosition: CGPoint, name: String, color: NSColor) -> GKEntity {
    let player = GKEntity()

    let playerRadius: CGFloat = 50
    let playerShape: SKShapeNode = SKShapeNode(circleOfRadius: playerRadius)
    playerShape.name = name
    playerShape.fillColor = color
    playerShape.position = startPosition
    playerShape.zPosition = 1.0

    player.addComponent(VisibleShapeComponent(withVisibleShape: playerShape))

    return player
  }
}
