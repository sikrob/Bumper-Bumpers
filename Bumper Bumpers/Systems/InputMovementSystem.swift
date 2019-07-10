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
      updateActiveDirections(fromCodes: input, component: component)
      updatePhysicsBodyVelocity(forComponent: component)
    }
  }

  func updateActiveDirections(fromCodes codes: [UInt16], component: InputMovementComponent) {
    for direction in component.inputDirections {
      component.activeDirections.updateValue(codes.contains(direction.key), forKey: direction.value)
    }
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
