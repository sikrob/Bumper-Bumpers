//
//  LossTrackingSystem
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 7/6/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

import GameplayKit

class LossTrackingSystem: GKComponentSystem<LossTrackingComponent> {
  override init() {
    super.init(componentClass: LossTrackingComponent.self)
  }

  func update() {
    for component in components {
      component.loser = !component.targeterShape.intersects(component.targetShape)
    }
  }

  func findWinner() -> String? {
    if components.first(where: { $0.loser }) != nil {
      return components.first(where: { !$0.loser })?.targeterShape.name
    }

    return nil
  }
}
