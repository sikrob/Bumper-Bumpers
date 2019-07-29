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
  let target: SKNode
  let targeter: SKNode
  var loser: Bool

  init(withTarget target: SKNode, targeter: SKNode) {
    self.target = target
    self.targeter = targeter
    self.loser = !targeter.intersects(target)
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
