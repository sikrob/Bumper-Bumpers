//
//  InputMovementActivationSystem.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/1/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class InputMovementSystem: GKComponentSystem<InputMovementComponent> {
  override init() {
    super.init(componentClass: InputMovementComponent.self)
  }

  func update(deltaTime seconds: TimeInterval, input: [UInt16]) {
    // update directions
    // update physics body
  }
}
