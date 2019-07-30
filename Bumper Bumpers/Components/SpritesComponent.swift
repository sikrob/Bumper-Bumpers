//
//  SpritesComponent
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/29/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class SpritesComponent: GKComponent {
  let sprites: [SKSpriteNode]
  var currentSpriteIndex: Int

  init(withSprites sprites: [SKSpriteNode]) {
    self.sprites = sprites
    self.currentSpriteIndex = sprites.count > 0 ? 0 : -1
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
