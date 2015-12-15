//
//  Game.swift
//  oopexercise
//
//  Created by Kath Faulkner on 14/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation

class Game {
    
    var p1: Character!
    var p2: Character!
    
    var startText: String = "Player 1; Choose your hero"
    var currentPlayer: String = "Player 1"
    
    init() {
        
    }
    
    func characterSelect(hero: Character) {
        if currentPlayer == "Player 1" {
            p1 = hero
        } else {
            p2 = hero
        }
    }
}