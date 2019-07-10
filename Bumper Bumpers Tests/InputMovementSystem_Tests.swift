//
//  InputMovementSystem_Tests.swift
//  Bumper Bumpers Tests
//
//  Created by Robert Sikorski on 7/8/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import XCTest
@testable import Bumper_Bumpers

class InputMovementSystem_Tests: XCTestCase {
  var inputMovementComponent: InputMovementComponent!
  var inputMovementSystem: InputMovementSystem!

  override func setUp() {
    super.setUp()
    let physicsBody = SKPhysicsBody(circleOfRadius: 10)
    inputMovementComponent = InputMovementComponent(with: physicsBody, baseMovementAcceleration: 10, inputDirections: [0:"DOWN", 1:"UP"])
    inputMovementSystem = InputMovementSystem()
    inputMovementSystem.addComponent(inputMovementComponent)
  }

  override func tearDown() {
    super.tearDown()
    inputMovementComponent = nil
    inputMovementSystem = nil
  }

  func testUpdateActiveDirectionsAccuratelyUpdates() {
    inputMovementSystem.updateActiveDirections(fromCodes: [1], component: inputMovementComponent)
    XCTAssert(!inputMovementComponent.activeDirections["DOWN"]!)
    XCTAssert(inputMovementComponent.activeDirections["UP"]!)
  }

  func testUpdatePhysicsBodyVelocityUpdatesComponentPhysicsBody() {
    inputMovementComponent.activeDirections.updateValue(true, forKey: "UP")
    inputMovementSystem.updatePhysicsBodyVelocity(forComponent: inputMovementComponent)
    XCTAssert(Int(inputMovementComponent.physicsBody.velocity.dy) == 10)
  }
}
