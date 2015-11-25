//
//  ViewController.swift
//  Sound Shaker
//
//  Created by SIVAGURUNATHAN.V on 09/10/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit
import AVFoundation

var currentSongIndex:Int = 0

var player:AVAudioPlayer = AVAudioPlayer()

class ViewController: UIViewController {

    
    var songArray:[String] = [ "song1","song2","song3","song4"]
    var imageArray:[String] = [ "batman_solid.png","joker_image.png"]
    @IBOutlet var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var swipeGesutre = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeGesutre.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeGesutre)
        
        var swipeGestureRight = UISwipeGestureRecognizer(target: self, action: "swiped:")
        swipeGestureRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeGestureRight)
        
        
        
    }
    
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        
        if event.subtype == UIEventSubtype.MotionShake {
            playMotionSong()
        }
    }
    
    
    func swiped(gesture : UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
                
            case UISwipeGestureRecognizerDirection.Left:
                playLeftSong()
                break
            case UISwipeGestureRecognizerDirection.Right:
                playRightSong()
                break
            default:
                break
            }
        }
    }
    
    func playRightSong(){
        image.image = UIImage(named: imageArray[1])
        self.view.addSubview(image)
    }
    
    func playLeftSong(){
        
        image.image = UIImage(named: imageArray[0])
        self.view.addSubview(image)
    }
    
    
    func playMotionSong(){
        
        // Playing audio while shaking so setting player
        
     
        
        println(self.songArray[currentSongIndex])
        
        println(NSBundle.mainBundle().pathForResource("song1", ofType: ".mp3"))
        
        
        println(NSBundle.mainBundle().pathForResource(songArray[currentSongIndex], ofType: ".mp3"))
        
        var audioPathForResource = NSBundle.mainBundle().pathForResource(self.songArray[currentSongIndex], ofType: ".mp3")!
        
        if currentSongIndex == 4{
            
            currentSongIndex = 0
        }
        else{
        currentSongIndex++
        }
        var error1:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPathForResource), error: &error1)
        
        if error1 == nil{
            player.play()
        }
        else{
            println(error1)
        }

    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

