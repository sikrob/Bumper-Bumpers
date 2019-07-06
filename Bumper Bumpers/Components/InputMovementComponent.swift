//
//  InputMovementComponent.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/1/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class InputMovementComponent: GKComponent {
  let physicsBody: SKPhysicsBody
  let baseMovementAcceleration: Int
  let inputDirections: Dictionary<UInt16, String>
  var activeDirections: Dictionary<String, Bool>

  init(with physicsBody: SKPhysicsBody, baseMovementAcceleration: Int, inputDirections: Dictionary<UInt16, String>) {
    self.physicsBody = physicsBody
    self.baseMovementAcceleration = baseMovementAcceleration
    self.inputDirections = inputDirections
    self.activeDirections = Dictionary(uniqueKeysWithValues: inputDirections.map({ (key: UInt16, value: String) -> (String, Bool) in
      return (value, false)
    }))
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
