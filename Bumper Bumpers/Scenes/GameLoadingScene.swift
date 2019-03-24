//
//  GameLoadingScene.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import SpriteKit

class GameLoadingScene: SKScene {
  var state: GameLoadingState?

  private var logoLabel: SKNode?
  private var lastUpdateTime: TimeInterval = 0
  private var complete: Bool = false

  func runLoadingAnimation() {
    self.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                SKAction.colorize(with: .white, colorBlendFactor: 1.0, duration: 1.0)]))
    logoLabel!.run(SKAction.sequence([SKAction.wait(forDuration: 1.5),
                                      SKAction.fadeAlpha(to: 0, duration: 0.75)]),
                   completion: {() -> Void in
                    self.complete = true
    })
  }

  override func sceneDidLoad() {
    self.scaleMode = .aspectFill
    self.logoLabel = self.childNode(withName: "LogoLabel")
  }

  override func update(_ currentTime: TimeInterval) {
    if lastUpdateTime == 0 {
      runLoadingAnimation()
    } else if (complete) {
      state!.enterMenuState()
    }

    lastUpdateTime = currentTime
  }
}
