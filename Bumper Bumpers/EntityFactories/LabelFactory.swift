//
//  LabelFactory.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/21/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import Foundation
import GameplayKit
import SpriteKit

class LabelFactory  {
  static func createLabel(withText text: String, position: CGPoint, name: String, visible: Bool, fontSize: CGFloat, fontColor: NSColor) -> GKEntity {
    let label = GKEntity()

    let labelNode = SKLabelNode(text: text)
    labelNode.name = name
    labelNode.position = position
    labelNode.fontName = "Helvetica Neue UltraLight"
    labelNode.fontSize = fontSize
    labelNode.alpha = visible ? 1.0 : 0.0
    labelNode.zPosition = 10.0
    labelNode.fontColor = fontColor
    label.addComponent(ClickableComponent(withClickableNode: labelNode, clickMode: .mouseUp))

    return label
  }
}
