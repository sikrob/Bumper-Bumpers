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

  init(with visibleShapeSystem: VisibleShapeSystem, inputMovementSystem: InputMovementSystem) {
    self.visibleShapeSystem = visibleShapeSystem
    self.inputMovementSystem = inputMovementSystem
    super.init()
  }

  override func update(deltaTime seconds: TimeInterval) {
    update(delatTime: seconds, input: [])
  }

  func update(delatTime seconds: TimeInterval, input: [UInt16]) {
    inputMovementSystem.update(deltaTime: seconds, input: input)
    visibleShapeSystem.update(deltaTime: seconds)
  }
}
