//
//  GameLoadingState.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class GameLoadingState: GKState {
  override func didEnter(from previousState: GKState?) {
    if let scene = GKScene(fileNamed: "GameLoadingScene"), let sceneNode = scene.rootNode as? GameLoadingScene {
      if let gameStateMachine = stateMachine as! GameStateMachine? {
        sceneNode.state = self
        gameStateMachine.gameViewController.skView.presentScene(sceneNode)
      }
    }
  }

  func enterMenuState() {
    if let gameStateMachine = stateMachine as! GameStateMachine? {
      gameStateMachine.enter(MainMenuState.self)
    }
  }
}
