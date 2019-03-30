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

    self.entities.append(contentsOf: [arena])

    for entity in entities {
      visibleShapeSystem.addComponent(foundIn: entity)
    }

    for shapeNode in visibleShapeSystem.allShapeNodes() {
      self.addChild(shapeNode)
    }
  }
}
