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
  let inputDirections: Dictionary<UInt16, String>
  var activeDirections: Dictionary<String, Bool>

  init(with physicsBody: SKPhysicsBody, inputDirections: Dictionary<UInt16, String>) {
    self.physicsBody = physicsBody
    self.inputDirections = inputDirections
    self.activeDirections = Dictionary(uniqueKeysWithValues: inputDirections.map({ (key: UInt16, value: String) -> (String, Bool) in
      return (value, false)
    }))
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func updateActiveDirection(forCode code: UInt16, status: Bool) {
    if let direction = inputDirections[code] {
      activeDirections[direction] = status
    }
  }

  func updateActiveDirections(forCodes codes: [UInt16]) {
    for direction in inputDirections {
      activeDirections[direction.value] = codes.contains(direction.key)
    }
  }
}