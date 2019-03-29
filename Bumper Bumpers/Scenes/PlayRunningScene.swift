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

  func createArena() {
    let arena = GKEntity()

    // arena add component for visibleShape
    // differs from player which has visibleShape AND physicalShape (use same node as reference)
    // or do we need to do that? isn't that only if we add physics body and let everything else get handled auto?

    self.entities.append(contentsOf: [arena])
  }

  override func sceneDidLoad() {
    createArena()
  }
}
