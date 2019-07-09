//
//  LossTrackingSystem_Tests.swift
//  Bumper Bumpers Tests
//
//  Created by Robert Sikorski on 7/6/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import XCTest
import SpriteKit
@testable import Bumper_Bumpers


class LossTrackingSystem_Tests: XCTestCase {
  var targetShape: SKShapeNode!
  var targeterShapeA: SKShapeNode!
  var targeterShapeB: SKShapeNode!
  var lossTrackingComponentA: LossTrackingComponent!
  var lossTrackingComponentB: LossTrackingComponent!
  var lossTrackingSystem: LossTrackingSystem!

  override func setUp() {
    super.setUp()

    targetShape = SKShapeNode(circleOfRadius: 10)
    targeterShapeA = SKShapeNode(circleOfRadius: 10)
    targeterShapeA.name = "ShapeA"
    targeterShapeB = SKShapeNode(circleOfRadius: 10)
    targeterShapeB.name = "ShapeB"
    lossTrackingComponentA = LossTrackingComponent(withTargetShape: targetShape, targeterShape: targeterShapeA)
    lossTrackingComponentB = LossTrackingComponent(withTargetShape: targetShape, targeterShape: targeterShapeB)
    lossTrackingSystem = LossTrackingSystem()
    lossTrackingSystem.addComponent(lossTrackingComponentA)
    lossTrackingSystem.addComponent(lossTrackingComponentB)
  }

  override func tearDown() {
    super.tearDown()
    lossTrackingComponentB = nil
    lossTrackingComponentA = nil
    targeterShapeB = nil
    targeterShapeA = nil
    targetShape = nil
  }

  func testFindWinnerReturnsNilWhenNoLosers() {
    targetShape.position = CGPoint(x: 0, y: 0)
    targeterShapeA.position = CGPoint(x: 0, y: 0)
    targeterShapeB.position = CGPoint(x: 0, y: 0)
    lossTrackingSystem.update()
    let winner: String? = lossTrackingSystem.findWinner()
    XCTAssertNil(winner)
  }

  func testFindWinnerReturnsNilWhenOnlyLosers() {
    targetShape.position = CGPoint(x: 0, y: 0)
    targeterShapeA.position = CGPoint(x: 100, y: 0)
    targeterShapeB.position = CGPoint(x: 100, y: 0)
    lossTrackingSystem.update()
    let winner: String? = lossTrackingSystem.findWinner()
    XCTAssertNil(winner)
  }

  func testFindWinnerReturnsWinnerNameIfWinner() {
    targetShape.position = CGPoint(x: 0, y: 0)
    targeterShapeA.position = CGPoint(x: 0, y: 0)
    targeterShapeB.position = CGPoint(x: 100, y: 0)
    lossTrackingSystem.update()
    let winner: String? = lossTrackingSystem.findWinner()
    XCTAssert(winner == targeterShapeA.name)
  }
}
