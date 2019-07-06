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
    for component in components {
      component.activeDirections = currentActiveDirections(fromCodes: input, component: component)
      //
    }
  }

  func currentActiveDirections(fromCodes codes: [UInt16], component: InputMovementComponent) -> Dictionary<String, Bool> {
    var currentActiveDirections: Dictionary<String, Bool> = [:]
    for direction in component.inputDirections {
      currentActiveDirections.updateValue(codes.contains(direction.key), forKey: direction.value)
    }

    return currentActiveDirections
  }
}
