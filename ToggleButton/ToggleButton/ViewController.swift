//
//  ViewController.swift
//  ToggleButton
//
//  Created by SIVAGURUNATHAN.V on 06/10/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var toolBar: UIToolbar!
    
    var play = true
    
    @IBOutlet var playPauseButton: UIBarButtonItem!
    
    
    @IBAction func playPauseChange(sender: AnyObject) {

        if play {
            self.playPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Pause, target: self, action: "playPauseChange")
            play = false
        }
        else {
        self.playPauseButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: "playPauseChange")
            play = true
            
        }
        var items = self.toolBar.items!
        items[0] = self.playPauseButton
        
        self.toolBar.setItems(items, animated: true)
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

