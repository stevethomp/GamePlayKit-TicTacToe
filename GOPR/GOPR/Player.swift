//
//  Player.swift
//  WatchTacToe
//
//  Created by Steven Thompson on 2015-09-07.
//  Copyright © 2015 stevethomp. All rights reserved.
//

import UIKit
import GameplayKit

enum TileStatus: String {
    case Player1, Player2
    case Empty
}

enum PlayerShape: Int {
    case X, O
}

class Player: NSObject, GKGameModelPlayer {
    var playerShape: PlayerShape
    var name: String
    var playerId: Int
    
    static var allPlayers = [Player(shape: PlayerShape.X), Player(shape: .O)]

    init(shape: PlayerShape) {
        self.playerShape = shape
        self.playerId = shape.rawValue
        
        if playerShape == .X {
            self.name = "X"
        } else {
            self.name = "O"
        }
        
        super.init()
    }
    
    var opponent: Player {
        if playerShape == .O {
            return Player.allPlayers[0]
        } else {
            return Player.allPlayers[1]
        }
    }
    
    var tileStatus: TileStatus {
        if playerShape == .X {
            return .Player1
        } else {
            return .Player2
        }
    }
}