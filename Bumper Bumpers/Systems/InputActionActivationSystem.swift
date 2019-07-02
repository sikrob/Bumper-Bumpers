//
//  InputActionActivationSystem
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 6/21/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class InputActionActivationSystem: GKComponentSystem<InputActionActiveComponent> {
  override init() {
    super.init(componentClass: InputActionActiveComponent.self)
  }

  func update(deltaTime seconds: TimeInterval, input: [UInt16]) {
//    print(input)
  }
}
