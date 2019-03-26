//
//  ClickCheckSystem.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/25/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class ClickCheckSystem: GKComponentSystem<ClickableComponent> {
  override init() {
    super.init(componentClass: ClickableComponent.self)
  }

  func update(at mousePosition: CGPoint, clickMode: ClickMode) {
    for component in components {
      if component.clickMode == clickMode {
        component.clicking = component.clickableNode.contains(mousePosition)
      }
    }
  }
}
