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
  var queuedMouseUps: Array<CGPoint> = []
  var systems: [GKComponentSystem<GKComponent>] = []

  private var stateMachine: PlaySceneStateMachine?

  private let inputMovementSystem: InputMovementSystem = InputMovementSystem()
  private let lossTrackingSystem: LossTrackingSystem = LossTrackingSystem()
  private let clickCheckSystem: ClickCheckSystem = ClickCheckSystem()

  func triggerGoToMainMenu() {
    state!.enterMainMenuState()
  }

  override func sceneDidLoad() {
    self.scaleMode = .aspectFill

    systems = [inputMovementSystem, lossTrackingSystem, clickCheckSystem] as! [GKComponentSystem<GKComponent>]

    for entity in setupPlayStateEntities() + setupWinStateEntities() {
      add(newEntity: entity)
    }

    let playPlayingState = PlayPlayingState(inputMovementSystem: inputMovementSystem, lossTrackingSystem: lossTrackingSystem)
    let playWinState = PlayWinState(clickCheckSystem: clickCheckSystem, lossTrackingSystem: lossTrackingSystem, mainMenuTransition: triggerGoToMainMenu)
    self.stateMachine = PlaySceneStateMachine(states: [playPlayingState, playWinState])
    self.stateMachine?.enter(PlayPlayingState.self)
  }

  func setupPlayStateEntities() -> [GKEntity] {
    let arena = ArenaFactory.createArena()

    // Ideally get these from user preferences:
    let player1InputActionDictionary:[UInt16:String] = [13: "UP", 0: "LEFT", 1: "DOWN", 2: "RIGHT"] // wasd
    let player2InputActionDictionary:[UInt16:String] = [35: "UP", 37: "LEFT", 41: "DOWN", 39: "RIGHT"] // pl;'
    let player1 = PlayerFactory.createPlayer(at: CGPoint(x: -150, y: 0), playerId: 1, color: .blue, actions: player1InputActionDictionary, arena: arena)
    let player2 = PlayerFactory.createPlayer(at: CGPoint(x: 150, y: 0), playerId: 2, color: .green, actions: player2InputActionDictionary, arena: arena)

    return [arena, player1, player2]
  }

  func setupWinStateEntities() -> [GKEntity] {
    let winLabel = LabelFactory.createLabel(withText: "", position: CGPoint(x: 0, y: 100), name: "WinLabel", visible: false, fontSize: 64, fontColor: .black)
    let mainMenuLabel = LabelFactory.createLabel(withText: "Main Menu", position: CGPoint(x: 0, y: 20), name: "MainMenuLabel", visible: false, fontSize: 48, fontColor: .black)
    let exitGameLabel = LabelFactory.createLabel(withText: "Exit", position: CGPoint(x: 0, y: -30), name: "ExitLabel", visible: false, fontSize: 48, fontColor: .black)

    return [winLabel, mainMenuLabel, exitGameLabel]
  }

  func add(newEntity entity: GKEntity) {
    entities.append(entity)

    for system in systems {
      system.addComponent(foundIn: entity)
    }

    if let visibleShapeComponent = entity.component(ofType: VisibleShapeComponent.self) {
      self.addChild(visibleShapeComponent.visibleShape)
    } else if let spriteComponent = entity.component(ofType: SpritesComponent.self) {
      self.addChild(spriteComponent.sprites[spriteComponent.currentSpriteIndex]) // there must be a better way to handle sprites...
    } else if let clickableComponent = entity.component(ofType: ClickableComponent.self) {
      self.addChild(clickableComponent.clickableNode)
    }
  }

  override func mouseUp(with event: NSEvent) {
    if !queuedMouseUps.contains(event.location(in: self)) {
      queuedMouseUps.append(event.location(in: self))
    }
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

    queuedMouseUps = []
  }
}
