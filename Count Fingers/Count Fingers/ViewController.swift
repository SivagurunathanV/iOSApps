//
//  ViewController.swift
//  Count Fingers
//
//  Created by SIVAGURUNATHAN.V on 07/09/15.
//  Copyright (c) 2015 countFingers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var inputFinger: UITextField!
    
    @IBOutlet var outputLabel: UILabel!
    @IBAction func findFingers(sender: AnyObject) {
    
        var randomFinger = arc4random_uniform(11)
        
        var input = inputFinger.text.toInt()

    
        if input != nil
        {
            if Int(randomFinger) == input
            {
                outputLabel.text = "Guessed Correctly"
            }else if input > 10{
                outputLabel.text = "Enter No 0:10"
            }
            else
            {
                outputLabel.text="No it's \(randomFinger)"
            }
        }
        else {
                outputLabel.text = "Please enter a number 0:10"
        }
    
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

