//
//  PlaySceneStates.swift
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 6/22/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

protocol PlaySceneState {
  func update(keyedInput: [UInt16], mousedInput: [ClickMode: [CGPoint]])
}
