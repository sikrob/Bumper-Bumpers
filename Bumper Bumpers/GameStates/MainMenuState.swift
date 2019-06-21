//
//  MainMenuState.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class MainMenuState: GKState {
  override func didEnter(from previousState: GKState?) {
    if let scene = GKScene(fileNamed: "MainMenuScene"), let sceneNode = scene.rootNode as? MainMenuScene {
      if let gameStateMachine = stateMachine as! GameStateMachine? {
        sceneNode.state = self
        gameStateMachine.gameViewController.skView.presentScene(sceneNode)
      }
    }
  }

  // to eventually replace with at least PlayIntroState
  func enterPlayState() {
    if let gameStateMachine = stateMachine as! GameStateMachine? {
      gameStateMachine.enter(PlayState.self)
    }
  }
}
