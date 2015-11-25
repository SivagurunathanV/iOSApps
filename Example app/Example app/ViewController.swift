//
//  ViewController.swift
//  Example app
//
//  Created by SIVAGURUNATHAN.V on 23/08/15.
//  Copyright (c) 2015 Deva&co. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var myTestLabel: UILabel!
    
    @IBOutlet var myButton: UIButton!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        myTestLabel.text = "Welcome to iOS"
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("Hello world")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

