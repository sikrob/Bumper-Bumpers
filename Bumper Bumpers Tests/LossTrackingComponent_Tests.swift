//
//  LossTrackingComponent_Tests.swift
//  Bumper Bumpers Tests
//
//  Created by Robert Sikorski on 7/6/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import XCTest
import SpriteKit
@testable import Bumper_Bumpers

class LossTrackingComponent_Tests: XCTestCase {
  var target: SKShapeNode!
  var targeter: SKShapeNode!

  override func setUp() {
    super.setUp()
    target = SKShapeNode(circleOfRadius: 10)
    targeter = SKShapeNode(circleOfRadius: 10)
  }

  override func tearDown() {
    super.tearDown()
    target = nil
    targeter = nil
  }

  func testCanInitWithNonLoser() {
    target.position = CGPoint(x: 0, y: 0)
    targeter.position = CGPoint(x: 0, y: 0)
    let lossTrackingComponent = LossTrackingComponent(withTarget: target, targeter: targeter)
    XCTAssert(!lossTrackingComponent.loser)
  }

  func testCanInitWithLoser() {
    target.position = CGPoint(x: 0, y: 0)
    targeter.position = CGPoint(x: 100, y: 0)
    let lossTrackingComponent = LossTrackingComponent(withTarget: target, targeter: targeter)
    XCTAssert(lossTrackingComponent.loser)
  }
}
