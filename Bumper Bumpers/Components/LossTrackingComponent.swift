//
//  IntersectionTargetComponent.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/6/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class LossTrackingComponent: GKComponent {
  let targetShape: SKShapeNode
  let targeterShape: SKShapeNode
  var loser: Bool

  init(withTargetShape targetShape: SKShapeNode, targeterShape: SKShapeNode) {
    self.targetShape = targetShape
    self.targeterShape = targeterShape
    self.loser = !targeterShape.intersects(targetShape)
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
