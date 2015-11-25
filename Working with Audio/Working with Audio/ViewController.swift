//
//  ViewController.swift
//  Working with Audio
//
//  Created by SIVAGURUNATHAN.V on 04/10/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

   var player:AVAudioPlayer = AVAudioPlayer()
    
    
    @IBOutlet var volumeButton: UISlider!
    
    
    @IBAction func play(sender: AnyObject) {
        var audioPath = NSBundle.mainBundle().pathForResource("madras", ofType: "mp3")!
        
        var error : NSError? = nil
        
        player = AVAudioPlayer(contentsOfURL: NSURL(string: audioPath), error: &error)
        
        if error == nil {
            
            player.play()
            
        } else {
            
            println(error)
            
        }
    
    }
    
    @IBAction func pause(sender: AnyObject) {
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

