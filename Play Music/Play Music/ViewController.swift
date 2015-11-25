//
//  ViewController.swift
//  Play Music
//
//  Created by SIVAGURUNATHAN.V on 05/10/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var duration:NSTimeInterval = 0
    var paused = false
    var player:AVAudioPlayer = AVAudioPlayer()
    
   
    @IBOutlet var pauseIcon: UIBarButtonItem!
    @IBOutlet var playIcon: UIBarButtonItem!
    @IBOutlet var stopIcon: UIBarButtonItem!
//    @IBOutlet var pauseIcon: UIBarButtonItem!
//    @IBOutlet var playIcon: UIBarButtonItem!
    
    
    

    
    
    
    
    @IBAction func play(sender: AnyObject) {
        
        pauseIcon.enabled = true
        stopIcon.enabled = true
        playIcon.enabled = false

        var pli = NSBundle.mainBundle().pathForResource("test", ofType: "mp3")!
        println(pli)

        println(NSURL(fileURLWithPath: pli))
        
        
        var error1:NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: pli), error: &error1)
        
        if error1 == nil {
            if paused == false{
                player.play()
              
                
            }
            else {
                player.currentTime = duration
//                player.playAtTime(duration)
                player.play()
            }
            
        } else {
            
            println(error1)
            
        }
        
    }

    
    @IBAction func stopButton(sender: AnyObject) {
        player.stop()
        paused = false
        stopIcon.enabled = false
    }
    
    @IBAction func pauseButton(sender: AnyObject) {
        duration = player.currentTime
        player.pause()
        paused = true
        playIcon.enabled = true
        stopIcon.enabled = true
        pauseIcon.enabled = false
        println(player.duration)
        println(player.currentTime)
        
    }
    
    @IBOutlet var sliderValue: UISlider!
    
    
    @IBAction func volumeChanged(sender: AnyObject) {
        player.volume = sliderValue.value
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        pauseIcon.enabled = false
        stopIcon.enabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

