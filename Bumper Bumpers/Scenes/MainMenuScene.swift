//
//  MainMenuScene.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
  var state: MainMenuState?

  private var mainLogoSprite: SKSpriteNode?
  private var startLabel: SKLabelNode?
  private var lastUpdateTime: TimeInterval = 0

  func runEntryAnimation() {
    mainLogoSprite?.run(SKAction.init(named: "LogoEntry")!,
                        completion: {() -> Void in
                          self.startLabel?.run(SKAction.fadeAlpha(to: 1, duration: 0.5))
    })
  }

  override func sceneDidLoad() {
    self.scaleMode = .aspectFill
    mainLogoSprite = self.childNode(withName: "MainLogoSprite") as! SKSpriteNode?
    mainLogoSprite?.alpha = 0
    startLabel = self.childNode(withName: "StartLabel") as! SKLabelNode?
    startLabel?.alpha = 0
  }

  override func update(_ currentTime: TimeInterval) {
    if lastUpdateTime == 0 {
      runEntryAnimation()
    }

    lastUpdateTime = currentTime
  }
}
