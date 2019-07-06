//
//  InputMovementActivationSystem.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/1/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class InputMovementSystem: GKComponentSystem<InputMovementComponent> {
  override init() {
    super.init(componentClass: InputMovementComponent.self)
  }

  func update(input: [UInt16]) {
    for component in components {
      component.activeDirections = currentActiveDirections(fromCodes: input, component: component)
      updatePhysicsBodyVelocity(forComponent: component)
    }
  }

  func currentActiveDirections(fromCodes codes: [UInt16], component: InputMovementComponent) -> Dictionary<String, Bool> {
    var currentActiveDirections: Dictionary<String, Bool> = [:]
    for direction in component.inputDirections {
      currentActiveDirections.updateValue(codes.contains(direction.key), forKey: direction.value)
    }

    return currentActiveDirections
  }

  func updatePhysicsBodyVelocity(forComponent component: InputMovementComponent) {
    let physicsBody = component.physicsBody
    var dx: Int = 0, dy: Int = 0

    for direction in component.activeDirections {
      if direction.value {
        if direction.key == "UP" {
          dy += component.baseMovementAcceleration
        }
        if direction.key == "DOWN" {
          dy -= component.baseMovementAcceleration
        }
        if direction.key == "RIGHT" {
          dx += component.baseMovementAcceleration
        }
        if direction.key == "LEFT" {
          dx -= component.baseMovementAcceleration
        }
      }
    }

    physicsBody.velocity = CGVector(dx: dx, dy: dy)
  }
}
