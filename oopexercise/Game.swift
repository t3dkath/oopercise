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
    
    init() {
        p1 = Troll(name: "Player 1")
        p2 = Character(name: "Player 2")
    }
}