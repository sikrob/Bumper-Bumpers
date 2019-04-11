//
//  PlayRunningScene.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/27/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayRunningScene: SKScene {
  var state: PlayRunningState?
  var entities: [GKEntity] = []

  private let visibleShapeSystem: VisibleShapeSystem = VisibleShapeSystem()

  override func sceneDidLoad() {
    self.scaleMode = .aspectFill

    let arena = ArenaFactory.createArena()
    let player1 = PlayerFactory.createPlayer(at: CGPoint(x: -150, y: 0), name: "Player1", color: .blue)
    let player2 = PlayerFactory.createPlayer(at: CGPoint(x: 150, y: 0), name: "Player2", color: .green)

    self.entities.append(contentsOf: [arena, player1, player2])

    for entity in entities {
      visibleShapeSystem.addComponent(foundIn: entity)
    }

    for shapeNode in visibleShapeSystem.allShapeNodes() {
      self.addChild(shapeNode)
    }
  }
}
