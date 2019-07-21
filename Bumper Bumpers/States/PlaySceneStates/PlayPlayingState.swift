//
//  PlayPlayingState
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 6/20/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class PlayPlayingState: GKState, PlaySceneState {
  private let inputMovementSystem: InputMovementSystem
  private let lossTrackingSystem: LossTrackingSystem

  init(inputMovementSystem: InputMovementSystem, lossTrackingSystem: LossTrackingSystem) {
    self.inputMovementSystem = inputMovementSystem
    self.lossTrackingSystem = lossTrackingSystem
    super.init()
  }

  override func update(deltaTime seconds: TimeInterval) {
    update(keyedInput: [], mousedInput: [:])
  }

  func update(keyedInput: [UInt16], mousedInput: [ClickMode: [CGPoint]]) {
    lossTrackingSystem.update()
    if lossTrackingSystem.findWinner() != nil {
      stateMachine!.enter(PlayWinState.self)
    }
    inputMovementSystem.update(input: keyedInput)
  }
}
