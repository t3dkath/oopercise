//
//  Character.swift
//  oopexercise
//
//  Created by Kath Faulkner on 14/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation

class Character {
    
    private var _hp: Int = 100
    var hp: Int {
        get {
            return _hp
        }
    }
    
    private var _attackPower: Int = 20
    var attackPower: Int {
        get {
            return _attackPower
        }
    }
    
    private var _name: String = "Player"
    var name: String {
        get {
            return _name
        }
    }
    
    var isAlive: Bool {
        if _hp <= 0 {
            return false
        } else {
            return true
        }
    }
    var isStunned: Bool = false
    
    
    init(startingHp: Int, attackPower: Int, name: String) {
        self._hp = startingHp
        self._attackPower = attackPower
        self._name = name
    }
    
    func onAttemptAttack(attacker: Character) ->Bool {
        self._hp -= attacker.attackPower
        
        return true
    }
    
}