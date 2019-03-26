//
//  ClickableComponent.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/25/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class ClickableComponent: GKComponent {
  let clickableNode: SKNode
  let clickMode: ClickMode
  var clicking: Bool = false

  init(withClickableNode clickableNode: SKNode, clickMode: ClickMode) {
    self.clickableNode = clickableNode
    self.clickMode = clickMode
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
