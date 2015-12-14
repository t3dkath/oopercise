//
//  Game.swift
//  oopexercise
//
//  Created by Kath Faulkner on 14/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation
import UIKit

class Game {
    
    var p1: Character!
    var p2: Character!
    
    init() {
        p1 = Character(startingHp: 100, attackPower: 20, name: "Player 1")
        p2 = Character(startingHp: 100, attackPower: 20, name: "Player 2")
    }
}