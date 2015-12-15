//
//  Troll.swift
//  oopexercise
//
//  Created by Kath Faulkner on 15/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import Foundation

class Troll: Character {
    
    override var size: [Int] {
        return [122, 177]
    }
    
    override var deathURL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("troll-death", ofType: "wav")!)
    }
    
    override var attackURL: NSURL {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("troll-attack", ofType: "wav")!)
    }
    
    
}