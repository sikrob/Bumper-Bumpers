//
//  ArenaFactory.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/30/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class ArenaFactory {
  static func createArena() -> GKEntity {
    let arena = GKEntity()

    let arenaRadius: CGFloat = 350
    let arenaShape = SKShapeNode(circleOfRadius: arenaRadius)
    arenaShape.name = "Arena"
    arenaShape.fillColor = .white
    arenaShape.position = CGPoint(x: 0, y: 0)
    arenaShape.zPosition = 0.0
    arena.addComponent(VisibleShapeComponent(withVisibleShape: arenaShape))

    return arena
  }
}
