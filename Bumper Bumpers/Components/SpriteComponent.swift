//
//  SpriteComponent
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/29/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class SpriteComponent: GKComponent {
  let sprite: SKSpriteNode

  init(withSprite sprite: SKSpriteNode) {
    self.sprite = sprite
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
