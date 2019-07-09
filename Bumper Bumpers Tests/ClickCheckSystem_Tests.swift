//
//  ClickCheckSystem_Tests.swift
//  Bumper Bumpers Tests
//
//  Created by Robert Sikorski on 7/8/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import XCTest
@testable import Bumper_Bumpers

class ClickCheckSystem_Tests: XCTestCase {
  var clickableNode: SKShapeNode!
  var clickableComponent: ClickableComponent!
  var clickCheckSystem: ClickCheckSystem!

  override func setUp() {
    super.setUp()
    clickableNode = SKShapeNode(circleOfRadius: 10)
    clickableComponent = ClickableComponent(withClickableNode: clickableNode, clickMode: .mouseUp)
    clickCheckSystem = ClickCheckSystem()
    clickCheckSystem.addComponent(clickableComponent)
  }

  override func tearDown() {
    super.tearDown()
    clickableNode = nil
    clickableComponent = nil
    clickCheckSystem = nil
  }

  func testUpdateChangesClickStatus() {
    clickableNode.position = CGPoint(x: 0, y: 0)
    let insideClick = CGPoint(x: 0, y: 0)
    XCTAssert(!clickableComponent.clicking)
    clickCheckSystem.update(at: insideClick, clickMode: .mouseUp)
    XCTAssert(clickableComponent.clicking)
  }
}
