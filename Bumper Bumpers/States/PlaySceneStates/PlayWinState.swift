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

  override func didEnter(from previousState: GKState?) {
    for component in clickCheckSystem.components {
      if component.clickableNode.name == "WinLabel", let labelNode = component.clickableNode as? SKLabelNode {
        labelNode.text = "\(lossTrackingSystem.findWinner()! as String) Wins!"
      }

      component.clickableNode.run(SKAction.fadeIn(withDuration: 1.0))
    }
  }

  override func update(deltaTime seconds: TimeInterval) {
    update(keyedInput: [], mousedInput: [:])
  }

  func update(keyedInput: [UInt16], mousedInput: [ClickMode : [CGPoint]]) {
    for input in mousedInput {
      for point in input.value {
        clickCheckSystem.update(at: point, clickMode: input.key)
      }
    }

    for component in clickCheckSystem.components {
      if component.clickableNode.name == "ExitLabel" && component.clicking {
        exit(0)
      }
    }
  }
}
