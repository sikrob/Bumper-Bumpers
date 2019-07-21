//
//  PlayWinState.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 6/21/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class PlayWinState: GKState, PlaySceneState {
  private let clickCheckSystem: ClickCheckSystem
  private let lossTrackingSystem: LossTrackingSystem

  init(clickCheckSystem: ClickCheckSystem, lossTrackingSystem: LossTrackingSystem) {
    self.clickCheckSystem = clickCheckSystem
    self.lossTrackingSystem = lossTrackingSystem
    super.init()
  }

  override func update(deltaTime seconds: TimeInterval) {
    update(keyedInput: [], mousedInput: [:])
  }

  func update(keyedInput: [UInt16], mousedInput: [ClickMode : [CGPoint]]) {
    print("Made it to win state!")
    print(lossTrackingSystem.findWinner())
  }
}
