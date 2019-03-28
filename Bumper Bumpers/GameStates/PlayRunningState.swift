//
//  PlayRunningState
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/27/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class PlayRunningState: GKState {
  override func didEnter(from previousState: GKState?) {
    if let scene = GKScene(fileNamed: "PlayRunningScene"), let sceneNode = scene.rootNode as? PlayRunningScene {
      if let gameStateMachine = stateMachine as! GameStateMachine? {
        sceneNode.state = self
        gameStateMachine.gameViewController.skView.presentScene(sceneNode)
      }
    }
  }
}
