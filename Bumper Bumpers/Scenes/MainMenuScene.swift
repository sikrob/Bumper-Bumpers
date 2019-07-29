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
  private var exitLabel: SKLabelNode?
  private var entities: [GKEntity] = []
  private var lastUpdateTime: TimeInterval = 0

  func runEntryAnimation() {
    mainLogoSprite?.run(SKAction.init(named: "LogoEntry")!,
                        completion: {() -> Void in
                          self.startLabel?.run(SKAction.fadeIn(withDuration: 0.5))
                          self.exitLabel?.run(SKAction.fadeIn(withDuration: 0.5))
    })
  }

  func handleMenuActions() {
    for entity in entities {
      if let clickableComponent = entity.component(ofType: ClickableComponent.self) {
        if clickableComponent.clicking {
          switch clickableComponent.clickableNode.name {
          case "StartLabel":
            state!.enterPlayState()
            break
          case "ExitLabel":
            NSApp.terminate(nil)
            break
          default:
            break
          }
        }
      }
    }
  }

  func initializeUiNodes() {
    mainLogoSprite = self.childNode(withName: "MainLogoSprite") as! SKSpriteNode?
    mainLogoSprite?.alpha = 0
    startLabel = self.childNode(withName: "StartLabel") as! SKLabelNode?
    startLabel?.alpha = 0
    exitLabel = self.childNode(withName: "ExitLabel") as! SKLabelNode?
    exitLabel?.alpha = 0
  }

  func initializeClickables() {
    if let startLabelNode = startLabel {
      let startLabelEntity = GKEntity()
      startLabelEntity.addComponent(ClickableComponent(withClickableNode: startLabelNode, clickMode: .mouseUp))
      entities.append(startLabelEntity)
    }
    if let exitLabelNode = exitLabel {
      let exitLabelEntity = GKEntity()
      exitLabelEntity.addComponent(ClickableComponent(withClickableNode: exitLabelNode, clickMode: .mouseUp))
      entities.append(exitLabelEntity)
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
