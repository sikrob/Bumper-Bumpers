//
//  PlaySceneStateMachine.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 6/22/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class PlaySceneStateMachine: GKStateMachine {
  func update(deltaTime seconds: TimeInterval, scene: PlayScene) {
    let currentInput = scene.activeKeys

    if let playSceneState = currentState as? PlaySceneState {
      playSceneState.update(delatTime: seconds, input: currentInput)
    } else if let updatableState = currentState {
      updatableState.update(deltaTime: seconds)
    }
  }
}
