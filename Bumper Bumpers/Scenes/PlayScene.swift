//
//  PlayScene.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/27/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import SpriteKit
import GameplayKit

class PlayScene: SKScene {
  var state: PlayState?
  var entities: [GKEntity] = []
  var activeKeys: Array<UInt16> = []

  private let visibleShapeSystem: VisibleShapeSystem = VisibleShapeSystem()

  override func sceneDidLoad() {
    self.scaleMode = .aspectFill

    let arena = ArenaFactory.createArena()

    // Ideally get these from user preferences:
    let player1InputActionDictionary:[UInt16:String] = [13: "UP", 0: "LEFT", 1: "DOWN", 2: "RIGHT"]
    let player2InputActionDictionary:[UInt16:String] = [35: "UP", 37: "LEFT", 41: "DOWN", 39: "RIGHT"]

    let player1 = PlayerFactory.createPlayer(at: CGPoint(x: -150, y: 0), name: "Player1", color: .blue, actions: player1InputActionDictionary)
    let player2 = PlayerFactory.createPlayer(at: CGPoint(x: 150, y: 0), name: "Player2", color: .green, actions: player2InputActionDictionary)

    self.entities.append(contentsOf: [arena, player1, player2])

    for entity in entities {
      visibleShapeSystem.addComponent(foundIn: entity)
    }

    for shapeNode in visibleShapeSystem.allShapeNodes() {
      self.addChild(shapeNode)
    }
  }

  override func keyDown(with event: NSEvent) {
    print(event.keyCode)

    if !activeKeys.contains(event.keyCode) {
      activeKeys.append(event.keyCode)
    }
  }

  override func keyUp(with event: NSEvent) {
    if activeKeys.contains(event.keyCode) {
      activeKeys.remove(at: activeKeys.firstIndex(of: event.keyCode)!)
    }
  }
}
