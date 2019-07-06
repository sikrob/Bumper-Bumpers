//
//  PlayPlayingState
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 6/20/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class PlayPlayingState: GKState, PlaySceneState {
  private let visibleShapeSystem: VisibleShapeSystem
  private let inputMovementSystem: InputMovementSystem
  private let lossTrackingSystem: LossTrackingSystem

  init(with visibleShapeSystem: VisibleShapeSystem, inputMovementSystem: InputMovementSystem, lossTrackingSystem: LossTrackingSystem) {
    self.visibleShapeSystem = visibleShapeSystem
    self.inputMovementSystem = inputMovementSystem
    self.lossTrackingSystem = lossTrackingSystem
    super.init()
  }

  override func update(deltaTime seconds: TimeInterval) {
    update(delatTime: seconds, input: [])
  }

  func update(delatTime seconds: TimeInterval, input: [UInt16]) {
    lossTrackingSystem.update()
    if let winner = lossTrackingSystem.findWinner() {
      print(winner) // transition to PlayWinState with winner in hand
    }
    inputMovementSystem.update(deltaTime: seconds, input: input)
    visibleShapeSystem.update(deltaTime: seconds)
  }
}
