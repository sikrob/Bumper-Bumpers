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
    let currentKeyedInput = scene.activeKeys
    let currentQueuedMouseUps: [ClickMode: [CGPoint]] = [.mouseUp: scene.queuedMouseUps]

    if let playSceneState = currentState as? PlaySceneState {
      playSceneState.update(keyedInput: currentKeyedInput, mousedInput: currentQueuedMouseUps)
    } else if let updatableState = currentState {
      updatableState.update(deltaTime: seconds)
    }
  }
}
