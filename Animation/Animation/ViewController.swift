//
//  ViewController.swift
//  Animation
//
//  Created by SIVAGURUNATHAN.V on 20/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 1
    var timer = NSTimer()
    var flag = true
    
    @IBOutlet var alientImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateImage"), userInfo: nil, repeats: true)
        
    }
    @IBAction func changeImage(sender: AnyObject) {
    
        if flag == true{
            timer.invalidate()
            flag=false
        }
        else
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("updateImage"), userInfo: nil, repeats: true)
            flag=true
            
        }
        
    }
    
    func updateImage(){
        if counter == 5{
            counter=1
        }else {
            counter++
        }
        
        alientImage.image = UIImage(named: "frame\(counter).png")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

