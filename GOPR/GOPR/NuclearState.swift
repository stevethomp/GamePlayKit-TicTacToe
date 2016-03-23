//
//  NuclearState.swift
//  GOPR
//
//  Created by Steven Thompson on 2015-12-07.
//  Copyright © 2015 stevethomp. All rights reserved.
//

import UIKit
import GameplayKit

class NuclearState: GKState {
    override func isValidNextState(stateClass: AnyClass) -> Bool {
        return false // we can never go back
    }
}
