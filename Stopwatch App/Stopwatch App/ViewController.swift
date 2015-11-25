//
//  ViewController.swift
//  Stopwatch App
//
//  Created by SIVAGURUNATHAN.V on 14/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var timerLabel: UILabel!
    
    var time = NSTimer()
    
    var count = 0
    
    func updateTime(){
        count++
        timerLabel.text = String(count)
    }
    
   
    
    @IBAction func playAction(sender: AnyObject) {
        time = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTime"), userInfo: "Time ticking", repeats: true)
    }
    
    @IBAction func stopAction(sender: AnyObject) {
        time.invalidate()
        count = 0
        timerLabel.text = "0"
    }
    
    @IBAction func pauseAction(sender: AnyObject) {
        time.invalidate()
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

