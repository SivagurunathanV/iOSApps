//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by SIVAGURUNATHAN.V on 22/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    var playerState = 1
    
    var tie_count = 0
    
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    var winningState = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    var gameContinues = true
    
    @IBAction func playAgainButtonPressed(sender: AnyObject) {
    
        playerState = 1
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        gameContinues = true
        
        for var i = 0 ;i < 9 ; i++ {
        
            var button =  UIButton()
        
            button = view.viewWithTag(i) as! UIButton
            
            button.setImage(nil, forState: .Normal)
        
        }
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        
        
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
       
        var image = UIImage()
        
        
        if gameState[sender.tag] == 0 && gameContinues && tie_count != 8 {
            
            
            
                gameState[sender.tag] = playerState
        
            if playerState == 1{
                image = UIImage(named: "nought.png")!
                playerState = 2
            
            }
            else{
                image = UIImage(named: "cross.png")!
                playerState = 1
            }
        
        
           
        
            
            for state in winningState {
            if gameState[state[0]] != 0 && gameState[state[0]] == gameState[state[1]] && gameState[state[1]] == gameState[state[2]] && gameState[state[0]] == gameState[state[2]]
                {
                 
                    if gameState[state[0]] == 1{
                        println("noughts won")
                        gameOverLabel.text = "noughts won"
                        tie_count = 0
                    
                    }else {
                        println("crosses won")
                        gameOverLabel.text = "crosses won"
                        tie_count = 0
                    }
                    self.gameContinues = false
                    
                    self.gameOverLabel.hidden = false
                    self.playAgainButton.hidden = false
                    
                    UIView.animateWithDuration(0.5, animations: { () -> Void in
                        self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
                        self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
                    })
                    
                    
                    
                }
            }
            sender.setImage(image, forState: .Normal)
            
            
//            for var i=0 ; i < 9 ; i++ {
//                if gameState[i] == 1 || gameState[i] == 2 {
//                    tie_count++
//                }
//                
//                
//            }
            
//            if tie_count == 9{
//                
//                self.gameContinues = false
//                self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
//                self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
//                
//                self.gameOverLabel.hidden = false
//                self.playAgainButton.hidden = false
//                
//            }

            
        }
//        else{
//                            self.gameContinues = false
//                            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
//                            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
//            
//                            self.gameOverLabel.hidden = false
//                            self.playAgainButton.hidden = false
//        }
        println(gameState)
        println("tie_count  \(tie_count)")
        
        if tie_count == 9{
        println("tie")
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

