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
  private let inputActionActiveSystem: InputActionActiveSystem

  init(with visibleShapeSystem: VisibleShapeSystem, inputActionActiveSystem: InputActionActiveSystem) {
    self.visibleShapeSystem = visibleShapeSystem
    self.inputActionActiveSystem = inputActionActiveSystem
    super.init()
  }

  override func update(deltaTime seconds: TimeInterval) {
    update(delatTime: seconds, input: [])
  }

  func update(delatTime seconds: TimeInterval, input: [UInt16]) {
    inputActionActiveSystem.update(deltaTime: seconds, input: input)
    visibleShapeSystem.update(deltaTime: seconds)
  }
}
