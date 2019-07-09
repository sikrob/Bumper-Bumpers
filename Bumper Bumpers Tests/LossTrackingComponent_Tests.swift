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
  var targetShape: SKShapeNode!
  var targeterShape: SKShapeNode!

  override func setUp() {
    super.setUp()
    targetShape = SKShapeNode(circleOfRadius: 10)
    targeterShape = SKShapeNode(circleOfRadius: 10)
  }

  override func tearDown() {
    super.tearDown()
    targetShape = nil
    targeterShape = nil
  }

  func testCanInitWithNonLoser() {
    targetShape.position = CGPoint(x: 0, y: 0)
    targeterShape.position = CGPoint(x: 0, y: 0)
    let lossTrackingComponent = LossTrackingComponent(withTargetShape: targetShape, targeterShape: targeterShape)
    XCTAssert(!lossTrackingComponent.loser)
  }

  func testCanInitWithLoser() {
    targetShape.position = CGPoint(x: 0, y: 0)
    targeterShape.position = CGPoint(x: 100, y: 0)
    let lossTrackingComponent = LossTrackingComponent(withTargetShape: targetShape, targeterShape: targeterShape)
    XCTAssert(lossTrackingComponent.loser)
  }
}
