//
//  GameController.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

// Most macro view of the game itself; start and stop
class GameController {
  private let gameViewController: ViewController
  private var gameStateController: GameStateMachine?

  init(withViewController viewController: ViewController) {
    self.gameViewController = viewController
  }

  func prepareGame() {
    self.gameStateController = GameStateMachine(with: self, gameViewController: gameViewController)

    enterGame()
  }

  func enterGame() {
    if let gameStateController = self.gameStateController {
      gameStateController.enter(GameLoadingState.self)
    }
  }

  func exitGame() {
    NSApplication.shared.terminate(self)
  }
}
