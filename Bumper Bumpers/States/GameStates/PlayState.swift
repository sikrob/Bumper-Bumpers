//
//  PlayState
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/27/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class PlayState: GKState {
  override func didEnter(from previousState: GKState?) {
    if let scene = GKScene(fileNamed: "PlayScene"), let sceneNode = scene.rootNode as? PlayScene {
      if let gameStateMachine = stateMachine as! GameStateMachine? {
        sceneNode.state = self
        gameStateMachine.gameViewController.skView.presentScene(sceneNode)
      }
    }
  }
}
