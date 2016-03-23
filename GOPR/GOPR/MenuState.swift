//
//  MenuState.swift
//  GOPR
//
//  Created by Steven Thompson on 2015-12-07.
//  Copyright © 2015 stevethomp. All rights reserved.
//

import UIKit
import GameplayKit

class MenuState: GKState {

    override func isValidNextState(stateClass: AnyClass) -> Bool {
        if stateClass == PlayingState.self {
            return true
        }
        return false
    }
    
    override func didEnterWithPreviousState(previousState: GKState?) {
        
    }
    
    override func willExitWithNextState(nextState: GKState) {
        
    }
    
    override func updateWithDeltaTime(seconds: NSTimeInterval) {
        
    }
}
