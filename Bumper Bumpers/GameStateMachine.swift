//
//  GameStateMachine.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 3/24/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

// Manage main game states, such as loadingGame, mainmenu, playing
class GameStateMachine: GKStateMachine {
  private let gameController: GameController
  let gameViewController: ViewController

  init(with gameController: GameController, gameViewController: ViewController) {
    self.gameController = gameController
    self.gameViewController = gameViewController

    var gameStates: [GKState] = []

    gameStates.append(GameLoadingState())
    gameStates.append(MainMenuState())
    // play loading state
    // play intro state
    // play running state

    super.init(states: gameStates)
  }

  func exitGame() {
    print("Thanks for playing!")
    gameController.exitGame()
  }
}
