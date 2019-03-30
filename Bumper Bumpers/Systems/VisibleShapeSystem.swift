//
//  VisibleShapeSystem.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/30/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

// Shape meaning SKShapeNode

import GameplayKit

class VisibleShapeSystem: GKComponentSystem<VisibleShapeComponent> {
  override init() {
    super.init(componentClass: VisibleShapeComponent.self)
  }

  func allShapeNodes() -> [SKShapeNode] {
    return components.map({(component: VisibleShapeComponent) -> SKShapeNode in
      return component.visibleShape
    })
  }
}
