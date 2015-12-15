//
//  ViewController.swift
//  oopexercise
//
//  Created by Kath Faulkner on 14/12/2015.
//  Copyright © 2015 T3D. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var textHolderImg: UIImageView!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var restartLbl: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    
    @IBOutlet weak var p1AttackBtn: UIButton!
    @IBOutlet weak var p2AttackBtn: UIButton!
    
    @IBOutlet weak var selectionTxt: UILabel!
    
    var game: Game!
    
    var attacker: Character!
    var defender: Character!
    
    var timerFunc: String!
    var stunTimer: NSTimer?
    
    let gameMusicURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("game-music", ofType: "wav")!)
    var gameMusic = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game = Game()
        
        do {
            try gameMusic = AVAudioPlayer(contentsOfURL: gameMusicURL)
            gameMusic.numberOfLoops = -1
            gameMusic.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        gameMusic.play()
    }

    
    @IBAction func onAttackPress(sender: AnyObject) {
        
        if sender.tag == 0 {
            attacker = game.p1
            defender = game.p2
            
            player2Stunned()
            timerFunc = "player2Enabled"
        } else {
            attacker = game.p2
            defender = game.p1
            
            player1Stunned()
            timerFunc = "player1Enabled"
        }
        
        defender.onAttemptAttack(attacker)
        
        if !defender.isAlive {
            
            gameOver()
            
        } else {
            stunTimer?.invalidate()
            stunTimer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector(timerFunc), userInfo: nil, repeats: false)
        }
        
    }
    
    @IBAction func onRestartPress(sender: AnyObject) {
        textLbl.text = ""
        textHolderImg.hidden = true
        textLbl.hidden = true
        
        restartBtn.hidden = true
        restartLbl.hidden = true
        
        player1Enabled()
        player2Enabled()
        game = Game()
    }
    
    func player1Stunned() { p1AttackBtn.enabled = false }
    func player2Stunned() { p2AttackBtn.enabled = false }
    func player1Enabled() { p1AttackBtn.enabled = true }
    func player2Enabled() { p2AttackBtn.enabled = true }
    
    func gameOver() {
        textLbl.text = "\(attacker.name) is the winner"
        textHolderImg.hidden = false
        textLbl.hidden = false
        
        restartBtn.hidden = false
        restartLbl.hidden = false
        
        stunTimer?.invalidate()
        defender.onDeath()
        
        player1Stunned()
        player2Stunned()
    }

}

