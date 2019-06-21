//
//  InputActionActiveComponent
//  Bumper Bumpers
//
//  Created by Robert Sikorski on 5/9/19.
//  Copyright © 2019 Robert Sikorski. All rights reserved.
//

/*
 * To be updated by InputKeySystem (track relevant active keys), consumed by various action systems
 *
 */

import GameplayKit

class InputActionActiveComponent: GKComponent {
  let actions: Dictionary<UInt16, String>
  var actives: Dictionary<String, Bool> = [:]

  init(withActionsDictionary actions: Dictionary<UInt16, String>) {
    self.actions = actions
    self.actives = Dictionary(uniqueKeysWithValues: actions.map({ (key: UInt16, value: String) -> (String, Bool) in
      return (value, false)
    }))
    super.init()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func updateActive(forCode code: UInt16, status: Bool) {
    if let actionName = actions[code] {
      actives[actionName] = status
    }
  }

  // Allows passing all active input codes and just filters against our action dictionary to determine if any relevant codes are
  // included
  func updateActives(forCodes codes: [UInt16]) {
    for action in actions {
      actives[action.value] = codes.contains(action.key)
    }
  }
}
