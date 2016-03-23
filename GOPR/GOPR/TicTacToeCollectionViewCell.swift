//
//  TicTacToeCollectionViewCell.swift
//  GOPR
//
//  Created by Steven Thompson on 2015-12-06.
//  Copyright © 2015 stevethomp. All rights reserved.
//

import UIKit

class TicTacToeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var played = false
    
    func playCell(shape: PlayerShape) {
        switch shape {
        case PlayerShape.X:
            imageView?.image = UIImage(named: "X")
        case PlayerShape.O:
            imageView?.image = UIImage(named: "O")
        }

        self.played = true
        self.userInteractionEnabled = false
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        self.played = false
        self.userInteractionEnabled = true
    }
}
