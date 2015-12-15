//
//  Character.swift
//  oopexercise
//
//  Created by Kath Faulkner on 14/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation
import AVFoundation

class Character {
    
    var deathURL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("man-death", ofType: "wav")!)
    }
    var deathSound = AVAudioPlayer()
    
    var attackURL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("man-attack", ofType: "wav")!)
    }
    var attackSound = AVAudioPlayer()
    
    
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
    
    
    init(name: String, startingHp: Int = 100, attackPower: Int = 20) {
        self._hp = startingHp
        self._attackPower = attackPower
        self._name = name
        
        setupSFX()
    }
    
    func onAttemptAttack(attacker: Character) ->Bool {
        if attackSound.playing {
            attackSound.stop()
            attackSound.currentTime = 0
        }
        attackSound.play()
        
        self._hp -= attacker.attackPower
        
        return true
    }
    
    func onDeath() {
        deathSound.play()
    }
    
    
    func setupSFX() {
        do {
            try deathSound = AVAudioPlayer(contentsOfURL: deathURL)
            deathSound.prepareToPlay()
        } catch let deathErr as NSError {
            print(deathErr.debugDescription)
        }
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: attackURL)
            attackSound.prepareToPlay()
        } catch let attackErr as NSError {
            print(attackErr.debugDescription)
        }
    }
    
}