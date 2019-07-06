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

  private var stateMachine: PlaySceneStateMachine?

  private let visibleShapeSystem: VisibleShapeSystem = VisibleShapeSystem()
  private let inputMovementSystem: InputMovementSystem = InputMovementSystem()
  private let lossTrackingSystem: LossTrackingSystem = LossTrackingSystem()

  override func sceneDidLoad() {
    self.scaleMode = .aspectFill

    let arena = ArenaFactory.createArena()

    // Ideally get these from user preferences:
    let player1InputActionDictionary:[UInt16:String] = [13: "UP", 0: "LEFT", 1: "DOWN", 2: "RIGHT"] // wasd
    let player2InputActionDictionary:[UInt16:String] = [35: "UP", 37: "LEFT", 41: "DOWN", 39: "RIGHT"] // pl;'
    let player1 = PlayerFactory.createPlayer(at: CGPoint(x: -150, y: 0), name: "Player1", color: .blue, actions: player1InputActionDictionary, arena: arena)
    let player2 = PlayerFactory.createPlayer(at: CGPoint(x: 150, y: 0), name: "Player2", color: .green, actions: player2InputActionDictionary, arena: arena)

    self.entities.append(contentsOf: [arena, player1, player2])

    for entity in entities {
      lossTrackingSystem.addComponent(foundIn: entity)
      inputMovementSystem.addComponent(foundIn: entity)
      visibleShapeSystem.addComponent(foundIn: entity)
    }

    for shapeNode in visibleShapeSystem.allShapeNodes() {
      self.addChild(shapeNode)
    }

    let playPlayingState = PlayPlayingState(withInputMovementSystem: inputMovementSystem, lossTrackingSystem: lossTrackingSystem)
    self.stateMachine = PlaySceneStateMachine(states: [playPlayingState])
    self.stateMachine?.enter(PlayPlayingState.self)
  }

  override func keyDown(with event: NSEvent) {
    if !activeKeys.contains(event.keyCode) {
      activeKeys.append(event.keyCode)
    }
  }

  override func keyUp(with event: NSEvent) {
    if activeKeys.contains(event.keyCode) {
      activeKeys.remove(at: activeKeys.firstIndex(of: event.keyCode)!)
    }
  }

  override func update(_ currentTime: TimeInterval) {
    if let playSceneStateMachine = stateMachine {
      playSceneStateMachine.update(deltaTime: currentTime, scene: self)
    }
  }
}
