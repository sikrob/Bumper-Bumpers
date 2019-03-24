//
//  ViewController.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {
  @IBOutlet var skView: SKView!
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let gameController = GameController(withViewController: self)
    gameController.prepareGame()
    gameController.enterGame()
  }
  
  override func viewWillAppear() {
    let viewWidth: CGFloat = 1280
    let viewHeight: CGFloat = 768
    
    let screen = NSScreen.main!
    let point = CGPoint(x: (screen.visibleFrame.width - viewWidth) / 2, y: (screen.visibleFrame.height - viewHeight) / 2)
    
    let window = skView.window! as NSWindow
    window.setFrame(NSRect(x: point.x, y: point.y, width: viewWidth, height: viewHeight), display: true)
    window.contentAspectRatio = NSMakeSize(viewWidth, viewHeight)
  }
}

