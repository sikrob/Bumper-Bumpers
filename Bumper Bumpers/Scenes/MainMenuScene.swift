//
//  MainMenuScene.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit
import SpriteKit

class MainMenuScene: SKScene {
  var state: MainMenuState?

  private let clickCheckSystem: ClickCheckSystem = ClickCheckSystem()

  private var mainLogoSprite: SKSpriteNode?
  private var startLabel: SKLabelNode?
  private var entities: [GKEntity] = []
  private var lastUpdateTime: TimeInterval = 0

  func runEntryAnimation() {
    mainLogoSprite?.run(SKAction.init(named: "LogoEntry")!,
                        completion: {() -> Void in
                          self.startLabel?.run(SKAction.fadeAlpha(to: 1, duration: 0.5))
    })
  }

  func handleMenuActions() {
    for entity in entities {
      if let clickableComponent = entity.component(ofType: ClickableComponent.self) {
        if clickableComponent.clickableNode.name != nil &&
          clickableComponent.clickableNode.name == "StartLabel" &&
          clickableComponent.clicking {
          state!.enterPlayState()
        }
      }
    }
  }

  func initializeUiNodes() {
    mainLogoSprite = self.childNode(withName: "MainLogoSprite") as! SKSpriteNode?
    mainLogoSprite?.alpha = 0
    startLabel = self.childNode(withName: "StartLabel") as! SKLabelNode?
    startLabel?.alpha = 0
  }

  func initializeClickables() {
    if let startLabelNode = startLabel {
      let startLabelEntity = GKEntity()
      startLabelEntity.addComponent(ClickableComponent(withClickableNode: startLabelNode, clickMode: .mouseUp))
      entities.append(startLabelEntity)
    }
  }

  override func sceneDidLoad() {
    self.scaleMode = .aspectFill

    initializeUiNodes()
    initializeClickables()

    for entity in entities {
      clickCheckSystem.addComponent(foundIn: entity)
    }
  }

  override func mouseUp(with event: NSEvent) {
    clickCheckSystem.update(at: event.location(in: self), clickMode: .mouseUp)
  }

  override func update(_ currentTime: TimeInterval) {
    if lastUpdateTime == 0 {
      runEntryAnimation()
    } else {
      handleMenuActions()
    }

    lastUpdateTime = currentTime
  }
}
