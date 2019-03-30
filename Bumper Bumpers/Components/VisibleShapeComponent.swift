//
//  VisibleShapeComponent.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/30/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class VisibleShapeComponent: GKComponent {
  let visibleShape: SKShapeNode

  init(withVisibleShape visibleShape: SKShapeNode) {
    self.visibleShape = visibleShape
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
